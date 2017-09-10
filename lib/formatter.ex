defmodule Formatter do
  defp get_formatted_entry(directory, git, branches) do
    "#{String.pad_trailing(directory, 40)}#{String.pad_trailing(git, 8)}#{branches}"
  end
  defp append_output(a, b) when a == "", do: "#{b}"
  defp append_output(a, b), do: "#{a}\n#{b}"

  defp get_git_output(is_git) do
    if is_git, do: "Yes", else: "No"
  end

  def get_header() do
    get_formatted_entry("Directory", "Git?", "Branches")
  end

  def get_results([], accumulator) do
    get_header() |> append_output(accumulator)
  end

  def get_results([ result | remaining ], accumulator) do
    git_output = get_git_output(result.git)
    output = get_formatted_entry(result.directory, git_output, "")
    result = append_output(accumulator, output)
    get_results(remaining, result)
  end
end
