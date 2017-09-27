require 'digest/md5'

 duplicates = File.new("/home/rodb/Temp/duplicates_files.csv", "w")
 no_duplicates = File.new("/home/rodb/Temp/no_duplicates_files.csv", "w")
 duplicates.puts("\t1st\t2nd\t3rd\t4th")
  # /media/de6978d1-e96b-4769-b54c-386182e8c236/top/Photos
hash = {}
i = 0
compare_dir = Array.new
compare_dir = ["/media/rodb/Seagate Backup Plus Drive/Soho/Vidoes/**/*.*","/mnt/sdb1/rodb/Documents/Soho/Vidoes/**/*.*"]
compare_dir.each {|x| Dir.glob(x).each do |filename|
   i += 1
    if (i % 1000 == 0)
      puts "file number #{i} #{Time.now}"
    end
  next if (File.directory?(filename) or !File.file?(filename) or File.size(filename) == 0)
  # puts 'Checking ' + filename

  key = Digest::MD5.hexdigest(IO.read(filename)).to_sym
  # puts "key = #{key}"
  if hash.has_key? key
    # puts "same file #{filename}"
          # puts "path =  directory = #{filename}" 

    hash[key].push filename
  else
    hash[key] = [filename]
  end
 end
                 }

hash.each_value do |filename_array|
# list files that are unique.  
#  if filename_array.length < 2
# list all files that appear in more than one place
  if filename_array.length > 1
    # puts "=== Identical Files ===\n"
    filename_array.each { |filename| duplicates.print "\t"+filename }
    duplicates.puts
  else
    no_duplicates.puts filename_array
  end
end