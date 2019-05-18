defmodule TimeRegister.MixProject do
  use Mix.Project

  def project do
    [
      app: :time_register,
      version: "0.1.0",
      elixir: "~> 1.8",
      escript: escript(),
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:elixir_google_spreadsheets, :timex],
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:elixir_google_spreadsheets, "~> 0.1.11"},
      {:timex, "~> 3.1"},
      {:tzdata, "~> 0.1.8", override: true} # Use this version with escript build
    ]
  end

  def escript, do: [main_module: TimeRegister]
end
