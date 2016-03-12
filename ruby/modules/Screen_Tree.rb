
  screen_file = File.new("~/Dell/ITS/Screens.csv","r")
  tree_structure = File.new("~/Dell/ITS/tree_structure.csv","w")
  
  screen_list = []
  class Screen
    attr_accessor(:parent, :number)
    def initialize(a_parent,a_number,a_name,a_lim_name)
      @parent         = parent
      @name         = a_name
      @lim_name   = a_lim_name
    end
    def add_parent (new_parent)
      @parent = @parent << new_parent
    end
  end
  
  screen_list = screen_file.strip
  
  screen_list.each {|record|
    screen_elements = Screen.new(record[1],record[2],record[3])}
  
  puts 
