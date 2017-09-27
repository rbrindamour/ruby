require 'digest/md5'

 duplicates = File.new("/Users/rodmcbrindamour/temp/duplicate-files.csv", "w")
 duplicates.puts("\tdirectory and name\tsize")
  # /media/de6978d1-e96b-4769-b54c-386182e8c236/top/Photos
hash = {}
i = 0
found_total = 0
#files = "/home/rbrindamour/Documents/Code/**/*.*"
#files2 = "/home/rbrindamour/Documents/Ruby/**/*.*"
search_files = ["/Users/rodmcbrindamour/**/*.*"]

begin
     
search_files.each {|files|
Dir.glob(files).each do |filename|
   #  puts 'Checking ' + filename
  next if not File.exists?(filename) or File.directory?(filename) or File.stat(filename).size < 200000000
   
   i += 1
    if (i % 100 == 0)
      puts "#{filename} file number #{i} file size #{File.stat(filename).size}"
    end
    
 #   rescue => ex
 #       puts "#{ex.class} #{ex.message}"
        
  #key = Digest::MD5.hexdigest(IO.read(filename)).to_sym
  duplicates.puts("\t#{filename}\t#{File.stat(filename).size}")
 # key = filename.to_sym
#  hash[key] = filename
    found_total = found_total + 1
  #   puts "key = #{key}"
  #if hash.has_key? key
  #  # puts "same file #{filename}"
  #        # puts "path =  directory = #{filename}" 
  #
  #  
  #else
  #  hash[key] = [filename]
  #end
  #puts ""
 end
                                                                                         }

end

#hash.each_value do |filename_array|
#  if filename_array.length > 0
#    # puts "=== Identical Files ===\n"
#    filename_array.each { |filename| duplicates.print "\t"+filename }
#    duplicates.puts
#  end
#end
puts "Searched Total =#{i} Found Total =#{found_total}"
