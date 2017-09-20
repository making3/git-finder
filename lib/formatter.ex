defmodule Formatter do
  def get_header() do
    get_formatted_entry("Directory", :hotpink, "Git?", "Branches")
  end

  def get_results([], accumulator) do
    List.insert_at(accumulator, 0, get_header())
  end

  def get_results([ result | remaining ], accumulator) do
    git_output = get_git_output(result.git)
    output = get_formatted_entry(result.directory, result.color, git_output, "")
    result = [ accumulator | output]
    get_results(remaining, result)
  end

  defp get_formatted_entry(directory, color, git, branches) do
    [
      color,
      "#{String.pad_trailing(directory, 40)}#{String.pad_trailing(git, 8)}#{branches}",
      "\n"
    ]
  end

  defp get_git_output(true), do: "Yes"
  defp get_git_output(_), do: "No"
end
