defmodule Pru.Mixfile do
  use Mix.Project

  def project do
    [
      name: "Pru",
      source_url: "https://github.com/nuclearcanary/pru",
      description: "Basic library that enables easy interaction with the PRU cores present in the BeagleBone Black.",
      app: :pru,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      package: package(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
        {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
  defp package do
    [maintainers: ["Mikel Cranfill"],
     files: ["lib", "LICENSE", "mix.exs", "README.md"],
     licenses: ["MIT"],
     links: %{"Github" => "https://github.com/nuclearcanary/pru"}]
  end
end
