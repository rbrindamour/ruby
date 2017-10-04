
  ap_file  = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/ScreensAP.csv","r")
  atm_file  = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/ScreensATM.csv","r")
  budget_file  = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/ScreensBudget.csv","r")
  nightly_file  = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/ScreensNightly.csv","r")
  shadow_file  = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/ScreensShadow.csv","r")
  system_admin_file  = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/ScreensSystemAdmin.csv","r")
  teller_file  = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/ScreensTeller.csv","r")
  
  #screen_file = File.new("/Dell/ITS/Screens.csv","r")
  #screens_out = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/Screens Out.csv","w")
  #tree_structure = File.new("~/Dell/ITS/tree_structure.csv","w")
  
  screen_list = []
  class Screen
    attr_accessor(:parent, :number)
    def initialize(a_parent,a_number,a_name,a_lim_name)
      @parent     = parent
      @name       = a_name
      @lim_name   = a_lim_name
    end
    def add_parent (new_parent)
      @parent = @parent << new_parent
    end
  end
  class Tree 
    #code
  end
  
  ap_file.each {|rec| screen_list << rec.strip}
  puts screen_list[3]
  #screen_list.each {|record|
  #  screen_elements = Screen.new(record[1],record[2],record[3])}
  #
  #puts 
