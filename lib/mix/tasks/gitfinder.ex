require Bunt

defmodule Mix.Tasks.GitFinder do
  use Mix.Task

  def run(args) do
    IO.puts "Finding directories"
    main(args)
  end

  def main(args \\ []) do
    files = Search.find(args)
    Formatter.get_results(files, [])
      |> Bunt.ANSI.format
      |> IO.puts
  end
end
