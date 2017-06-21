 # List of LIM(program?) names from ITS
 its_lims_in = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/ITS LIM Names4.txt","r")
 # Export of all LIM names in repository
 lims_in = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/LIMs List3.txt","r")
 
 programs_in = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/Program List.txt","r")
 #lim_string = lims_in.to_s.downcase
 
 
 # List of all LIMs and Use Cases
 lim_list_out = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/ITS LIMs Matched4.txt","w")
 
 # Array of LIM names
 
 its_lims_array = []
 lim_string = ""
 lim_array = []
 program_string = ""
 program_name = ""
 lim_name = ""
 
 lim_list_out.puts "UC #\tScreen Name\tLIM Name\tProgram Name\tMatch"

 its_lims_in.each {|file_record| rec = file_record.strip
      its_lims_array << rec.split(/\t/).to_a 
        }
 #its_lims_array = its_lims_in.read.downcase
 program_string = programs_in.read.downcase
 
 lims_in.each {|file_record| rec = file_record.strip
      lim_string += (rec.downcase + "\n")
        }
  lims_in = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/LIM List.txt","r")

 lims_in.each {|file_record| rec = file_record.strip
      lim_array << rec.downcase.split(/\t/).to_a
        }
 #programs_in.each {|file_record| rec = file_record.strip
 #     program,codepackage,namespace,type = rec.split(/\t/)
 #     program_string += (program.downcase + "\n")
 #     puts program
 #       }
 #puts lim_string[0..200] 
 # for all of the ITS LIMS look for an existing LIM unless not found then look for an existing program
 its_lims_array.each {|its_uc_number,its_screen,its_lim|
      if its_uc_number == "01.01.007"
       puts "#{its_uc_number}\t#{its_screen}\t#{its_lim}"
      end
      
      #puts its_lim
           #if its_lim.match(/\w*\.\w*$/)
           #     program_name = its_lim.match(/\w*\.\w*$/)[0]
           #else
           #     program_name = its_lim.match(/\w*$/)[0]
           #end
           #puts program_name
       if its_lim
         
           if lim_string.include? its_lim.downcase then
               lim_array.each {|lim,pgm| 
                                      (lim_name = lim) if lim.match(its_lim.downcase)}
               lim_list_out.puts "#{its_uc_number}\t#{its_screen}\t#{lim_name}\t\tLIM Found"
               #puts "#{its_lim}, #{lim_name}"
           else
                program_name = its_lim.match(/[_|\.\/](\w*.designer.cs)|((\w*.|)\w*$)/)[0].gsub(/\//,"")
                if program_string.include? program_name
                     lim_list_out.puts "#{its_uc_number}\t#{its_screen}\t#{its_lim}\t#{program_name}\tProgram Found"
                     #puts program_name
                else
                    lim_list_out.puts "#{its_uc_number}\t#{its_screen}\t#{its_lim}\t\tNo Match"
                end
           end
       end
      } 
  puts "Done! \a"