#teststring = 
#newstring=teststring.split(/(?=[A-Z])/).each{|element| puts element; element.capitalize}.join(" ")
#  newstring[0..0]=newstring[0..0].capitalize
#  puts newstring
newstring = ''
def camelToTitle(instring)
  outstring = instring.split(/(?=[A-Z])/).join(" ")
    firstletter = outstring[0..0].capitalize
    outstring = firstletter+outstring[1..99]
end

 puts camelToTitle("myCamelCaseText")

  
