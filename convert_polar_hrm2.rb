require 'rexml/document'
require 'find'
require 'time'

# SETUP
#directory = 'C:\\Temp\\CardioTrainer_2011-01-06T21-42-42Z.txt'
# puts "please enter the file to read from: "
# directory = gets.chomp
 directory =  '/home/rodb/Documents/Sports/Rod Brindamour/2001/01031502.hrm'
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
             when 'inttimes' 
                    puts "inside when row is #{$row}"
                if line != ""then                   
                   case $row
                   when 1+(5*$lap) 
                    # puts  line.gsub(' ',",").to_a
                         time_val[0] = parse_time(line[0,9])
                         hr_val[0],hr_min[0],hr_avg[0],hr_max[0] = line[10,line.length-1].split(" ")
                         puts time_val[0], hr_max[0]
                         puts "inside when 1"
                   when 2+(5*$lap)
                    #puts  line.gsub(' ',",").to_a
                         flags[0],rec_time[0],rec_hr[0],speed[0],cadence[0],altitude[0] = line.split(" ")
                         #puts altitude
                         puts "inside when 2"
                   when 3+(5*$lap)
                        #puts  line.gsub(' ',",").to_a
                        extra1[0],extra2[0],extra3[0],asc[0],dist[0] = line.split(" ")
                   when 4+(5*$lap)
                        #puts  line.gsub(' ',",").to_a
                        lap_type[0],lap_dist[0],power[0],temperature[0],phase_lap[0],air_pressure[0] = line.split(" ")
                   when 5+(5*$lap)
                        #puts  line.gsub(' ',",").to_a
                        stride_avg[0],autom_lap[0],future1[0],future2[0],future3 [0]= line.split(" ")
                        puts "reached row 5"
                        $lap +=1
                   #when 6
                   # # puts  line.gsub(' ',",").to_a
                   #      time_val[1] = parse_time(line[0,9])
                   #      hr_val[1],hr_min[1],hr_avg[1],hr_max[1] = line[10,line.length-1].split(" ")
                   #      puts time_val[1], hr_max[1]
                   #      puts "inside when 1"
                   #when 7
                   # #puts  line.gsub(' ',",").to_a
                   #      flags[1],rec_time[1],rec_hr[1],speed[1],cadence[1],altitude[1] = line.split(" ")
                   #      #puts altitude
                   #      puts "inside when 2"
                   #when 8
                   #     #puts  line.gsub(' ',",").to_a
                   #     extra1[1],extra2[1],extra3[1],asc[1],dist[1] = line.split(" ")
                   #when 9
                   #     #puts  line.gsub(' ',",").to_a
                   #     lap_type[1],lap_dist[1],power[1],temperature[1],phase_lap[1],air_pressure[1] = line.split(" ")
                   #when 10
                   #     #puts  line.gsub(' ',",").to_a
                   #     stride_avg[1],autom_lap[1],future1[1],future2[1],future3 [1]= line.split(" ")
                   #     puts "reached row 10"
                   #    $row=-1
                end
                end
             $row +=1
    end
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

