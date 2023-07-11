defmodule Inet.MixProject do
  use Mix.Project

  @version "0.1.0"
  @scm_url "https://github.com/suhanlee/inet.ex"

  @elixir_requirement "~> 1.11"

  def project do
    [
      app: :inet_ex,
      version: @version,
      elixir: @elixir_requirement,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      name: "Inet.ex",
      description:
        "Inet.ex` was created in Elixir to simplify the invocation of address and DNS queries using `:inet",
      source_url: @scm_url,
      homepage_url: @scm_url,
      docs: docs()
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
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:makeup_html, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["suhanlee"],
      licenses: ["MIT"],
      links: %{"GitHub" => @scm_url},
      files: ~w(lib LICENSE.md mix.exs README.md .formatter.exs)
    ]
  end

  defp docs do
    [
      main: "Inet.ex",
      extras: ["README.md"]
    ]
  end
end
