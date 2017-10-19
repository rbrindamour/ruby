class NokogiriController 
  def index
    # Load the xml file into a String
    xml_file = File.read("/home/rodb/Documents/Sports/Sports Tracker/rb2012-11-16-T.gpx")
  
    # Parse the XML and create the Graph representing the XML document
    doc = Nokogiri::XML.parse(xml_file)
  
    # Extract only results from Group C
    # If you are not familiar with xpath
    # //result             -> fetch results from anywhere in the document
    # [group_name="Grp.C"] -> select only nodes who have a child called group_name with value "Grp.C"
    grp_c_results = doc.xpath('//result[group_name="trk"]')
    
    
    # Add some padding for pretty print
    format = "%20s %4s  %s"
    
    # Add header aligned with results %28 -> forces the string to end at char 28 of the line
    results = "%28s" % "Group C\n\n"
    
    # Extract teams and score, since .xpath returns an array, we can iterate the results
    results += grp_c_results.map do |x|
      
      # Return a pretty printed line with teams and score, note that .xpath('home_team') only returs
      #  one entry in the array, so calling #text will only show one entry.
      format % [
        x.xpath('home_team').text,
        x.xpath('score').text,
        x.xpath('away_team').text
      ]
    end.join("\n")
  
    # render the output as plain text page
    render :text => results, :content_type => 'text/plain'
  end
  a = NokogiriController.new
  puts a.index
end