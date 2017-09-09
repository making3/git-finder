defmodule Formatter do
  # TODO: Formatted directories/output evenly
  defp get_formatted_entry(directory, git, branches), do: "#{directory}\t\t\t\t#{git}\t#{branches}"
  defp append_output(a, b) when a == "", do: "#{b}"
  defp append_output(a, b), do: "#{a}\n#{b}"

  defp get_git_output(is_git) do
    if is_git, do: "Yes", else: "No"
  end

  def get_header() do
    get_formatted_entry("Directory", "Git?", "Branches")
  end

  def get_results([], accumulator) do
    header = get_header()
    append_output(header, accumulator)
  end

  def get_results([ result | remaining ], accumulator) do
    git_output = get_git_output(result.git)
    output = get_formatted_entry(result.directory, git_output, "")
    result = append_output(accumulator, output)
    get_results(remaining, result)
  end
end
