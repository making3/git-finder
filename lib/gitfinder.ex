require Bunt

defmodule Main do
  def main(args \\ []) do
    files = Search.find(args)
    Formatter.get_results(files, [])
      |> Bunt.ANSI.format
      |> IO.puts
  end
end
