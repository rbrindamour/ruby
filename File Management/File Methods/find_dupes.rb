require 'digest/md5'
puts require 'in_array'
ignore_list = ".MOV", ".mov"
puts "ignore list = #{ignore_list[0]}"

def in_array?(in_string,array)
  array.map {|x| return x if in_string[x]}
end

hash = {}

 def parse(directory_to_parse)
  Dir.glob("/home/rodb/Pictures/**/*.*", File::FNM_DOTMATCH).each {|filename| 
      puts filename
      puts "ignore list = #{ignore_list[1]}"
    if (File.directory?(filename) or in_array(filename,ignore_list))
       # puts 'Checking ' + filename
       puts "path = #{directory_to_parse} directory = #{filename}"
       parse(directory_to_parse+filename)
       next
    else 
       key = Digest::MD5.hexdigest(IO.read(filename)) #.to_s.to_sym
      
       puts "key = #{key}"
       puts "--- blank line ---"
      if hash.has_key? key
          # puts "same file #{filename}"
         hash[key].push filename
       else
          hash[key] = [filename]
       end
     end
     }
     end
    hash.each_value { |filename_array|
      if filename_array.length > 1
        puts "=== Identical Files ===\n"
        filename_array.each { |filename| puts ' '+filename }
      end
    }
   
  directory_to_parse = "/home/rodb/Pictures/"
 # filename = ""
 # puts "path = #{directory_to_parse} directory = #{filename}" 

 parse(directory_to_parse)
