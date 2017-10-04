 # Use Case Export with Number, Title, Description Category, LIMs tab separated
 lims_in = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/All Linked LIMs in 2016-11-07.txt","r")

 
 # List of all LIMs and Use Cases
 lim_list_out = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/All UC LIM List 2016-11-07.txt","w")
 
 lims_array_in = []
 lims_in.each {|in_rec|
      lims_array_in << in_rec
      #puts lims_array_in
      }
 count = 0
 lims_array_in.each {|log_record| rec = log_record
      record_fields = rec.split(/\t/)
       uc_number = record_fields[0]
       uc_name = record_fields[1]
       category = record_fields[2]
       lim_name = record_fields[3]
       #puts "#{uc_number}\t #{category}\t#{lim_name}"
       #if lim_name
#          lims = lim_name.split(/,/)
          lims = lim_name.split(/\n/)

          lims.each {|lim|
               lim_list_out.puts "#{uc_number}\t#{uc_name}\t#{category}\t#{lim}"
               #puts "#{lims} \t #{lim}" if uc_number == "01.05.010" 
               count += 1
               }
        }
 puts count
 