require 'rexml/document'
require 'find'
require 'time'

# SETUP
#directory = 'C:\\Temp\\CardioTrainer_2011-01-06T21-42-42Z.txt'
# puts "please enter the file to read from: "
# directory = gets.chomp
 directory =  '/home/rodb/Documents/Sports/Rod Brindamour/2002/02123103.hrm'
# directory = '/home/rodb/Documents/Sports/Sports Tracker/rb2012-11-16-2.gpx'

special_char = /\[|\]/

     def parse_time(time_string)
       temp = Time.parse(time_string)
     end
     

polar_hrm = File.open(directory,'r')
time_val = []
hr_val = []
hr_min = []
hr_avg = []
hr_max = []
 flags= [0],rec_time=[0],rec_hr=[0],speed=[0],cadence=[0],altitude=[0]
extra1=[0],extra2=[0],extra3=[0],asc=[0],dist=[0]
lap_type=[0],lap_dist=[0],power=[0],temperature=[0],phase_lap=[0],air_pressure=[0]
stride_avg=[0],autom_lap=[0],future1=[0],future2=[0],future3 =[0]
 
line_array = []
section = ""
$row = 0
polar_hrm.each {|line_in|
   line = line_in.chomp.downcase
   line_array = line.split("=")
  # puts "section is #{section} row is #{$row}"
      #puts line_array
      cmd_name = line_array[0]
      #puts cmd_name, cmd_name.class
   if line.match(special_char) then
          section = line.gsub(special_char,"")
         puts "found section #{section}"
         $row = 0
         $lap = 0
   end
   case section
             when 'note'
                note = []
                puts "note row  #{$row}"
                if $row >= 1 && (line != "")  then puts note[$row] = line;
           end
               $row += 1
             when 'inttimes' 
                    puts "inside when row is #{$row}"
                if line != "" then
                   case $row
                   when row_lap = 1+(5*$lap)
                    # puts  line.gsub(' ',",").to_a
                         time_val[row_lap] = parse_time(line[0,9])
                         hr_val[row_lap],hr_min[row_lap],hr_avg[row_lap],hr_max[row_lap] = line[10,line.length-1].split(" ")
                         puts time_val[row_lap], hr_max[row_lap]
                         puts "inside when 1"
                   when 2+(5*$lap)
                    #puts  line.gsub(' ',",").to_a
                         flags[row_lap],rec_time[row_lap],rec_hr[row_lap],speed[row_lap],cadence[row_lap],altitude[row_lap] = line.split(" ")
                         #puts altitude
                         puts "inside when 2"
                   when 3+(5*$lap)
                        #puts  line.gsub(' ',",").to_a
                        extra1[row_lap],extra2[row_lap],extra3[row_lap],asc[row_lap],dist[row_lap] = line.split(" ")
                   when 4+(5*$lap)
                        #puts  line.gsub(' ',",").to_a
                        lap_type[row_lap],lap_dist[row_lap],power[row_lap],temperature[row_lap],phase_lap[row_lap],air_pressure[row_lap] = line.split(" ")
                   when row_lap = 5+(5*$lap)
                        #puts  line.gsub(' ',",").to_a
                        stride_avg[row_lap],autom_lap[row_lap],future1[row_lap],future2[row_lap],future3 [row_lap]= line.split(" ")
                        puts "reached row 5"
                        $lap +=1
                   end
                end
             $row +=1
             when 'intnotes'
                intnotes = []
                puts "intnotes row  #{$row}"
                if $row >= 1 && (line != "") then puts intnotes[$row] = line;
           end
               $row += 1
               when 'extradata'
                extradata = []
                puts "extradata row  #{$row}"
                if $row >= 1 && (line != "") then puts extradata[$row] = line;
           end
               $row += 1
               when 'summary-123'
                summary_123 = []
                puts "summary_123 row  #{$row}"
                if $row >= 1 && (line != "") then puts summary_123[$row] = line;
           end
               $row += 1
               when 'summary_th'
                summary_th = []
                puts "summary_th row  #{$row}"
                if $row >= 1 && (line != "") then puts summary_th[$row] = line;
           end
               $row += 1
               when 'hrzones'
                hrzones = []
                puts "hrzones row  #{$row}"
                if $row >= 1 && (line != "") then puts hrzones[$row] = line;
           end
               $row += 1
               when 'swaptimes'
                swaptimes = []
                puts "swaptimes row  #{$row}"
                if $row >= 1 && (line != "") then puts swaptimes[$row] = line;
           end
               $row += 1
               when 'hrdata'
                hrdata = []
                puts "hrdata row  #{$row}"
                if $row >= 1 && (line != "") then puts hrdata[$row] = line;
           end
               $row += 1
          
               
   end
   #$row = 0
   #    if line == ""  then puts "blank line"; section = ""
   #       else
   #         if line_array[1].to_s =~ /:/ then puts "Time is  "
   #   else
   #      #puts cmd_name  + " = " +  line_array[1].to_s
   #      #puts "#{eval(cmd_name  + " = " +  line_array[1].to_s)}"
   # end
   #end
     #puts "variable is #{eval(cmd_name)}"
   
}
puts polar_hrm

