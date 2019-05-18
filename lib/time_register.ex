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

  def main(args \\ []) do
    {opts, _, _} = OptionParser.parse(args,
      switches: [ item: :string ],
      aliases: [i: :item]
      )
    IO.puts "Not implemented yet"
  end

end
