def titleToCamel(instring)
    outstring = instring.split(" ")
    first_term = outstring[0].to_s.downcase
    rest = outstring[1..99]
    outstring = first_term+rest.join("")
end

  elements = ["Vacation Paid Days Off","Holiday Paid Days Off","Other Paid Days Off","OverTime 1 Rate","OverTime 2 Rate","Monday Straight Time Hours","Monday OverTime 1 Hours","Monday OverTime 2 Hours","Tuesday Straight Time Hours","Tuesday OverTime 1 Hours","Tuesday OverTime 2 Hours","Wednesday Straight Time Hours","Wednesday OverTime 1 Hours","Wednesday OverTime 2 Hours","Thursday Straight Time Hours","Thursday OverTime 1 Hours","Thursday OverTime 2 Hours","Friday Straight Time Hours","Friday OverTime 1 Hours","Friday OverTime 2 Hours","Saturday Straight Time Hours","Saturday OverTime 1 Hours","Saturday OverTime 2 Hours","Sunday Straight Time Hours","Sunday OverTime 1 Hours","Sunday OverTime 2 Hours","Bonus at Location"] 
  elements.each {|element| puts "<lim-element label=\"#{element}\" data-type=\"string\" name=\"#{titleToCamel(element)}\" type=\"element\">\n</lim-element>"}
#  \n<domain-binding domain-model=\"etk_fca\" entity-name=\"LaborWageComponentWageRatio\" property-name=\"baseWageRatioToPipeWelder\"/>

