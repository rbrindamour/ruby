 # List of LIM(program?) names from ITS
 puts "Started #{Time.now}"
 
 its_lims_in = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/All Linking 2016-09-05core.txt","r")
 # Export of all LIM names in repository
 lims_in = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/All UC LIM List.txt","r")
 
 #programs_in = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/Program List.txt","r")
 #lim_string = lims_in.to_s.downcase
 
 
 # List of all LIMs and Use Cases
 lim_list_out = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/Full LIMs Names.txt","w")
 
 # Array of LIM names
 
 its_lims_array = []
 lim_string = ""
 lim_array = []
 #program_string = ""
 #program_name = ""
 lim_name = ""
 
 lim_list_out.puts "UC #\tScreen Name\tITS LIM Name\tLIM Name\tProgram Name\tMatch"

 its_lims_in.each {|file_record| rec = file_record.strip
      its_lims_array << rec.split(/\t/).to_a 
        }
 #its_lims_array = its_lims_in.read.downcase
 #program_string = programs_in.read.downcase
 
 lims_in.each {|file_record| rec = file_record.strip
      lim_string += (rec.downcase + "\n")
        }
 
 puts "lim_string created #{Time.now}"
  lims_in = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/LIM List.txt","r")

 lims_in.each {|file_record| rec = file_record.strip
      lim_array << rec.split(/\t/).to_a
        }
 
 puts "lim_array created #{Time.now}"
 
 #programs_in.each {|file_record| rec = file_record.strip
 #     program,codepackage,namespace,type = rec.split(/\t/)
 #     program_string += (program.downcase + "\n")
 #     puts program
 #       }
 #puts lim_string[0..200] 
 # for all of the ITS LIMS look for an existing LIM, if not found then look for an existing program
 its_lims_array.each {|its_uc_number,its_uc_name,its_category,its_screen,its_lim|
      #found = nil
      #if its_uc_number == "03.01.022"
      # puts "#{its_uc_number}\t#{its_screen}\t#{its_lim}\t#{its_lim.match(/[_|\.\/]((\w*.|)\w*$)|(\w*.designer.cs)/)[0].gsub(/\//,"").gsub(/\//,"")}"
      #end
       if its_lim
               temp_program_name = its_lim.match(/[_|\.\/]((\w*.|)\w*$)|(\w*.designer.cs)/)
               if temp_program_name then
                program_name = temp_program_name[0].gsub(/\//,"").gsub(/_/,"")
               else
                puts "assign program > #{program_name = " "}"
               end
       end
      
      #puts its_lim
           #if its_lim.match(/\w*\.\w*$/)
           #     program_name = its_lim.match(/\w*\.\w*$/)[0]
           #else
           #     program_name = its_lim.match(/\w*$/)[0]
           #end
           #puts program_name
       if its_lim
         #puts "its_lim = #{its_lim} program name = #{program_name}"
           if lim_string.include? its_lim.downcase then
                # compare all linked LIMs against the ITS LIM name
               lim_array.each {|lim,pgm| 
                                   if lim.downcase.match(its_lim.downcase) then
                                        lim_name = lim
                                        lim_list_out.puts "#{its_uc_number}\t#{its_screen}\t#{its_lim}\t#{lim_name}\t\tLIM Found"
                                        if its_uc_number == "05.01.004"
                                            puts "#{its_uc_number}\t#{its_lim}\t#{lim_name}"
                                        end
                                        
                                        next
                                   end
                              }
           #    #next
           #    #puts "#{its_lim}, #{lim_name}"
           else
               #lim_list_out.puts "#{its_uc_number}\t#{its_screen}\t#{its_lim}\t\t\tNo Match"
               #iterate over the lim_array again if the full name isn't found
               if lim_string.include? program_name.downcase then
                    lim_array.each {|lim,pgm|
                                   if lim.downcase.match(program_name.downcase) then
                                   #puts "its_lim = #{its_lim} program name = #{program_name}"
                                   next
                                   end
                                   }
                   lim_list_out.puts "#{its_uc_number}\t#{its_screen}\t#{its_lim}\t\t#{program_name}\tProgram Found"
               #next
               end
           end
       end
       #next
      }
 puts "Finished #{Time.now}"
 
  puts "Done! \a"