ap_file  = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/ScreensAP.csv","r")
atm_file  = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/ScreensATM.csv","r")
budget_file  = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/ScreensBudget.csv","r")
nightly_file  = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/ScreensNightly.csv","r")
shadow_file  = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/ScreensShadow.csv","r")
system_admin_file  = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/ScreensSystemAdmin.csv","r")
teller_file  = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/ScreensTeller.csv","r")
$screens_out = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/Screens Out.csv","w")

file_list = [ap_file,atm_file,budget_file,nightly_file,shadow_file,system_admin_file,teller_file]
$all_screens = {}
$all_links = {}
screen_array = []
$level = 0


 def display_screen(screen_id,record_array,level)
         
      #if $previous_category != record_array[0]
      #  $screens_out.puts record_array[0]
      #end
      
  #puts "level is #{level}"
  #puts "Screen id #{screen_id} record_array 1 #{record_array[1]} record_array 2 #{record_array[2]}"
     if record_array[1] != "-1"
         #puts "#{$previous_screen}    #{record_array[2]}"
         if          $printed[record_array[2]]
            return
         end
         
        if $previous_screen != record_array[2]
           $level.times {$screens_out.print ","}
           $screens_out.print ",#{record_array[2]} #{record_array[3]}"
           $screens_out.puts
         #$screens_out.puts "rec 1 = #{record_array[1]} prev = #{$previous_screen} rec 2 = #{record_array[2]}"
         $previous_screen = record_array[2]
         $printed[record_array[2]] = true
         #$previous_category = record_array[0]
         end
        if $all_links[record_array[2]]
          $all_links[record_array[2]].each {|next_screen_id|
             $level += 1
             display_screen(next_screen_id,$all_screens[next_screen_id],$level)
             
         }
        end
      end
     if record_array[1] == "-1"
         if          $printed[record_array[2]]
            return
         end
       
        $screens_out.print ",#{record_array[2]} #{record_array[3]}"
        $screens_out.puts
         #$screens_out.puts "rec 1 = #{record_array[1]} prev = #{$previous_screen} rec 2 = #{record_array[2]}"
        
        $previous_screen = record_array[2]
  #puts "record key #{record_array[2].class} #{$all_links.key(record_array[2])}"
        if $all_links[record_array[2]]
          $all_links[record_array[2]].each {|next_screen_id|
            #puts "Next screen #{next_screen_id} #{$all_screens[next_screen_id]}"
          $level = 1  
          display_screen(next_screen_id,$all_screens[next_screen_id],$level)
           }
        end
      #else 
  #puts "Inside else"
  #      #$level.times {print ","}
  #      print "#{record_array[2]} #{record_array[3]}"
  #      if $all_links[record_array[2]]
  #        $all_links[record_array[2]].each {|next_screen_id| 
  #        $level += 1
  #        display_screen(next_screen_id,$all_screens[next_screen_id],$level)
  #
  #         }
  #      end
     end
   end
   #Build hash of screen_ids to find parent id
  file_list.each {|screens_in|
     #screens_in.each {|e| puts e}
     $all_screens = {}
     $all_links = {}
     $printed = {}

  screens_in.each {|screen_rec|

      screen_rec_clean = screen_rec.strip
      screen_array = screen_rec_clean.split(/,/)
      $module_name,parent_id,screen_id1,title,access,screen_id2,new_record_title,edit_record_title,actual_object_name = screen_rec_clean.split(/,/)
      $all_screens[screen_id1] = screen_array #module_name,parent_id,screen_id1,title,access,screen_id2,new_record_title,edit_record_title,actual_object_name
     if $all_links[parent_id]
        $all_links[parent_id] = $all_links[parent_id] << screen_id1
          else
            $all_links[parent_id] = [screen_id1]
     end
     
      }

# Begin
    #$all_links["172"].each {|e| puts e}
     #$previous_category = ""
        $screens_out.puts $module_name
     
     $all_screens.each {|key, value|
     #puts "#{key}  #{value[1]}"
     if value[1] = "-1" then
       display_screen(key, value, 0)
     end
      }
  }