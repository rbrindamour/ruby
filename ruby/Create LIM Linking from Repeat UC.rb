 # Use Case Export with Number, Title, Description Category, LIMs tab separated
 lims_in = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/UC to LIMs from ITS 2016-11-21.txt","r")

 
 # List of all LIMs and Use Cases
 lim_list_out = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/UC Importer 2016-11-22_02.txt","w")
 
 lims_array_in = []
 lims_in.each {|in_rec|
      lims_array_in << in_rec
      #puts lims_array_in
      }
 uc_hash = Hash.new
 count = 0
 lims_array_in.each {|log_record| rec = log_record
      record_fields = rec.strip.split(/\t/)
       uc_raw_numbers = record_fields[0]
       lim_name = record_fields[1]
       if uc_raw_numbers.match(/,/)
          uc_raw_numbers.split(/,/).each {|e|
            if uc_hash[e] 
                 uc_hash[e] += ", #{lim_name}"
              #   puts "#{e} #{uc_hash.key(e)} = #{uc_hash[e]}"
            else uc_hash[e] = lim_name
            end
          }
       elsif uc_hash[uc_raw_numbers]
                 uc_hash[uc_raw_numbers] += ", #{lim_name}"
            else uc_hash[uc_raw_numbers] = lim_name
       end
       }
 
          uc_hash.each {|uc_number,lim_name|
               puts lim_name
               lim_list_out.puts "#{uc_number}\t #{lim_name}"
               #puts "#{lims} \t #{lim}" if uc_number == "01.05.010" 
               count += 1
               }
  puts count
 