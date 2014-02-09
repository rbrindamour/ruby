def titleToCamel(instring)
#  instring.sub!(/%|\?|-/,"")
    outstring = instring.split(" ")
    first_term = outstring[0].to_s.downcase
    rest = outstring[1..99]
    outstring = first_term+rest.join("")
end

  elements = [
    "Wages Incl Overtime Prems","Burden plus TLO","Indirect Labor Rate","Temporary Buildings","Funiture Furnishings Equipment","Contruction Camp","Utilities Distribution","Utilities Comsumption","Scaffolding","Site Maintenance","Material Handling","All Other Temporary Construction","Consumables","Subtotal TCCs","Supervision","Support Personnel","Burden","Bonuses","Housing","Other Allowances","Relocation","User Defined","Field Office Operations","Procured Services Concrete Soils and NDT Testing","Business Travel","Subtotal Supervision","General Foreman","Home Office Support","Subtotal Overall Supervision","Grading Compacting","Excavating Loading","Mobile Crane Lifting","Crawler Other Lifting","Trucking","Personnel Transport","Machinery Misc. Equipment","Fuels Lubes","Maintenance","Rigging","User Defined","Heavy Lift Allowance","Hand Tools","Subtotal Construction Equipment","Subtotal","Subcontractor Overheads Fees","Grand Total"    ] 
  count = -1
    elements.each {|element| puts "<lim-element data-type=\"string\" label=\"#{element}\" name=\"#{if !(titleToCamel(element).gsub!(/[?,-,\/,%,>,#,<]/,"")); titleToCamel(element) else (titleToCamel(element).gsub!(/[?,-,\/,%,>,#,<]/,"")) end }\" type=\"element\">      <meta-property name=\"sample-data\"></meta-property>    </lim-element>"}
 