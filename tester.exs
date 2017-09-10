#require Git
require Search
require Formatter
require Main

#for file <- files, file.git do
  #repo = Git.new file.directory
#
  #IO.inspect Git.status repo
#end

Main.main([ "~/dev", "~/dev/sora" ])
