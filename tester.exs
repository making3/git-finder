#require Git
require Search
require Formatter

files = Search.find("~/dev")

#for file <- files, file.git do
  #repo = Git.new file.directory
#
  #IO.inspect Git.status repo
#end

IO.puts Formatter.get_results(files, "")
