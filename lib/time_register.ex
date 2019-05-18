defmodule TimeRegister do
  @moduledoc """
  Documentation for TimeRegister.
  """

  @doc """
  main

  Receives a time item to update and puts the current time in the correspondent sheet cell

  ## parameters
    item: It's one of: sm (start at morning); em (end at morning); sa (start at afternoon); ea (end at afternoon)
  """
  require Logger

  def main(args \\ []) do
    Logger.debug ["args: ", inspect(args)]
    {opts, _, _} = OptionParser.parse(args,
      switches: [ item: :string, show: :boolean ],
      aliases: [i: :item, s: :show]
      )

    item = opts[:item]

    settings = Poison.decode!(Path.expand("~/.time_register/settings.json") |> File.read!)

    spreadsheet_url = settings["spreadsheet_url"]
    header_rows = settings["header_rows"]
    columns_to_update = settings["columns_to_update"]

    {:ok, pid} = GSS.Spreadsheet.Supervisor.spreadsheet(spreadsheet_url)

    date = Date.utc_today()

    {:ok, row} = GSS.Spreadsheet.read_row(pid, (date.day + header_rows), column_to: columns_to_update)
    Logger.info ["initial row: ", inspect(row)]

    if !opts[:show] do
      datetime = Timex.local
      time_str = Timex.format!(datetime, "%H:%M", :strftime)

      positions = [ "sm", "sa", "em", "ea" ]

      position = Enum.find_index(positions, fn x -> x == item end)

      new_row = List.replace_at(row, (position + 1), time_str)

      GSS.Spreadsheet.write_row(pid, (date.day + header_rows), new_row)

      {:ok, row} = GSS.Spreadsheet.read_row(pid, (date.day + header_rows), column_to: columns_to_update)
      Logger.info ["row: ", inspect(row)]
    end
  end
end
