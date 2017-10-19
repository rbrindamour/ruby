in_screens = [[-1, 172],[172, 173], [-1,208], [172, 774],[172, 175], [208, 209]]
screens = {}
roots = {}

# Assign all of the pairs to screens

in_screens.each {|parent,child|
    puts "parent = #{parent}  child = #{child}"
    if screens[parent] then
        #screens[parent] = Array.new
        screens[parent] = screens[parent] << child
    else
        screens[parent] = Array.new
        screens[parent] = child
    end
    # Create array of Roots to parse for trees
    if parent == -1
        puts "assign root1 = #{roots}"
        roots[child] = []
        puts "assign root2 = #{roots}"
    else
        roots[parent] = roots[parent] << child
    end
    }
#screens.each {|ind,val| puts "#{ind}  #{val}"}

# puts roots
def tree(root,screen)
    if root.class == Array 
        root = root[0]
        screen = root[1]
    end
    print("inside tree root = #{root}  screen = #{screen}")
    
    if screen
        puts screen[0]
        screen = screen - screen[0]
        screen.each {|screen_key| tree(screen, screens[screen_key])}
    end
end    
roots.each {|ind|
    puts "Roots ind is #{ind}"
    tree(ind,nil)}

screens.each {|ind,val|
    puts "screens is #{screens}"
    #tree(ind,val)
    }
