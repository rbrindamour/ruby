screen_names  = File.new("C:/Users/rod_brindamour/Documents/Clients/ITS/Repository/UseCaseLims-5 test.csv","r")
$screens = []
temp_stripped = []
screen_names.each {|ucl|
  temp_stripped = ucl.strip.gsub("\n01.","01.")
  puts temp_stripped #.length

puts "temp_stripped[0] is ==== #{temp_stripped[0]}, [2] is >> #{temp_stripped[2]}"
 }
