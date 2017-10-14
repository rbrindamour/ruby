#!/usr/bin/env ruby
  ap_file  = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/ScreensAP.csv","r")
  screens_out = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/Screens Out.csv","w")
  Node = Struct.new(:parent, :child)
  screen_list = Node.new
  ap_file.each {|rec|
    rec_array = rec.strip.split(/,/)
    screen_list.parent(rec_array[1]) = rec_array[2]
    }
  puts screen_list.parent('172')
  level = 1
  def print_tree(parent, child, level)
    level.times {|x| print "\t"}
    print("#{parent} , #{child}")
    puts
    if screen_list.parent(child)
        print_tree(child, screen_list.parent(child), (level += 1))
      else
        return
    end
    
  end
  screen_list.each {|index,value| print_tree(index, value, level) }