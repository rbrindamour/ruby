require 'digest/md5'

 duplicates = File.new("/home/rbrindamour/temp/duplicate-files.csv", "w")
 duplicates.puts("\t1st\t2nd\t3rd\t4th")
  # /media/de6978d1-e96b-4769-b54c-386182e8c236/top/Photos
hash = {}
i = 0
found_total = 0
#files = "/home/rbrindamour/Documents/Code/**/*.*"
#files2 = "/home/rbrindamour/Documents/Ruby/**/*.*"
search_files = ["/home/rbrindamour/Documents/Code/**/*.*"],["/home/rbrindamour/Documents/Ruby/**/*.*"]
search_files.each {|files|
Dir.glob(files).each do |filename|
     puts 'Checking ' + filename
  next if File.directory?(filename)
  # or File.stat(filename).size < 2049
   i += 1
    if (i % 1000 == 0)
      puts "#{filename} file number #{i} file size #{File.stat(filename).size}"
    end

  key = Digest::MD5.hexdigest(IO.read(filename)).to_sym
  # puts "key = #{key}"
  if hash.has_key? key
    # puts "same file #{filename}"
          # puts "path =  directory = #{filename}" 

    hash[key].push filename
    found_total = found_total + 1
  else
    hash[key] = [filename]
  end
  puts ""
 end
                                                                                         }

hash.each_value do |filename_array|
  if filename_array.length > 1
    # puts "=== Identical Files ===\n"
    filename_array.each { |filename| duplicates.print "\t"+filename }
    duplicates.puts
  end
end
puts "Searched Total =#{i} Found Total =#{found_total}"