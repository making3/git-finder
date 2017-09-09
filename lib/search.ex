# Objectives:
#• Tool to go through directories and check if the directory is a git directory
   #◦ Report if it’s git
   #◦ Report if it’s commited code
   #◦ Report if there are branches not commited and stuff
   #◦ Basically a backup....
# Determine type of project (NodeJS, Elixir, etc) 

defmodule Search do
  def find(dirs) when is_bitstring(dirs) do
    find([ dirs ])
  end

  def find(dirs) do
    for dir <- dirs,
        full_dir = Path.expand(dir),
        inner_dir <- File.ls!(full_dir),
        path = Path.join(full_dir, inner_dir),
        File.dir?(path) do
      is_git_path = is_git(path)

      %{ 
        directory: path, 
        git: is_git_path 
       }
    end
  end

  def is_git(dir) do
    ".git" in File.ls!(dir)
  end
end
