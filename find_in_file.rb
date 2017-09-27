#search through all files in the directory and find any line that contains the string "To:"
directory = '/home/rodb/Temp/Spam/*.*'
spamfiles = []
Dir.glob(directory).each {|x| spamfiles << x}
address_list = File.new("/home/rodb/Temp/Spam/spammed_address.txt",'w')
spamfiles.each {|file|
  File.open(file,'r').each {|content| address_list.puts content if content.match('To:')} }
address_list.close