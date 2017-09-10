defmodule Main do
  def main(args \\ []) do
    files = Search.find(args)
    IO.puts Formatter.get_results(files, "")
  end
end
