# Objectives:
#• Tool to go through directories and check if the directory is a git directory
   #◦ Report if it’s git
   #◦ Report if it’s commited code
   #◦ Report if there are branches not commited and stuff
   #◦ Basically a backup....
# Determine type of project (NodeJS, Elixir, etc) 

defmodule Search do
  defp is_git(dir) do
    ".git" in File.ls!(dir)
  end

  defp get_directory_output(path) do
      %{ 
        directory: path,
        git: is_git(path)
       }
  end

  def find(dirs) when is_bitstring(dirs) do
    find([ dirs ])
  end

  def get_inner_directories(directory) do
    File.ls!(directory) |> Enum.map(fn(inner) -> Path.join(directory, inner) end)
  end

  def find(dirs) do
    dirs
      |> Enum.map(&Path.expand/1)
      |> Enum.filter(&File.dir?/1)
      |> Enum.map(&get_inner_directories/1)
      |> List.flatten
      |> Enum.filter(&File.dir?/1)
      |> Enum.map(&get_directory_output/1)
  end
end
