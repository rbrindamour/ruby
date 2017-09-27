#search through all files in the directory and find any line that contains the string the search_string
puts ("enter the directory to search");STDOUT.flush
directory =  gets.chomp
puts ("enter the string to find");STDOUT.flush
search_string =  gets.chomp
# directory = '/home/rodb/Temp/Spam/*.*'
puts "search_string is #{search_string} and directory is #{directory}"
spamfiles = []
Dir.glob(directory).each {|x| spamfiles << x}
address_list = File.new("/home/rodb/Temp/Spam/spammed_address.txt",'w')
spamfiles.each {|file|
  File.open(file,'r').each {|content| address_list.puts "File #{file}  >>> #{content}" if content.match(search_string)} }
address_list.close
