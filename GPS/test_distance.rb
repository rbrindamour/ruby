require 'rexml/document'
require 'find'
require 'time'

# SETUP
#directory = 'C:\\Temp\\CardioTrainer_2011-01-06T21-42-42Z.txt'
puts "please enter the file to read from: "
directory = gets.chomp 
# directory = '/home/rodb/Documents/Sports/Sports Tracker/rb2012-11-16-2.gpx'

# output file
  $tempfile=File.open("/home/rodb/Documents/Sports/Sports Tracker/dm_elements2012-11-16.txt",  'w')   
   
     def distance(lat1,long1,lat2,long2)
        #convert from degrees to radians
       if (lat1 == lat2)&(long1 == long2)
         return 0
       else
        a1 = lat1 * (Math::PI / 180)
        b1 = long1 * (Math::PI / 180)
        a2 = lat2 * (Math::PI / 180)
        b2 = long2 * (Math::PI / 180)
        
        r_e = 6378.135 #radius of the earth in kilometers (at the equator)
        #note that the earth is not a perfect sphere, r is also as small as
        r_p = 6356.75 #km at the poles
        
        #find the earth's radius at the average latitude between the two locations
        theta = (lat1 + lat2) / 2
        
        r = Math.sqrt(((r_e**2 * Math.cos(theta))**2 + (r_p**2 * Math.cos(theta))**2) / ((r_e * Math.cos(theta))**2 + (r_p * Math.cos(theta))**2))
        
        #do the calculation with radians as units
        d = r * Math.acos(Math.cos(a1)*Math.cos(b1)*Math.cos(a2)*Math.cos(b2) + Math.cos(a1)*Math.sin(b1)*Math.cos(a2)*Math.sin(b2) + Math.sin(a1)*Math.sin(a2))
      end
     end
     
     def parse_time(time_string)
       temp = Time.parse(time_string)
     end

        
#  Initialize
  file = File.new( directory )
  doc = REXML::Document.new file

  first_time = true
  totaldistance = 0
       doc.elements.each('gpx/trk/trkseg/trkpt') {|elem| 
         if first_time
           $time2 = Time.now
           a , b =  elem.attributes['lat'], elem.attributes['lon']
           $lat2, $lon2 =  a.to_f,  b.to_f
           $time2 = parse_time(elem.elements['time'].to_a.to_s)
          $tempfile.puts "Distance\tElevation\tHR\tTime"
           first_time = false
        else  
           $lat1, $lon1 = $lat2, $lon2
           a , b =  elem.attributes['lat'], elem.attributes['lon']
           $lat2, $lon2 =  a.to_f,  b.to_f
           dist = distance($lat1,$lon1,$lat2,$lon2)
           elevt = elem.elements['ele'].to_a
           ext = elem.elements['extensions'].to_a
           hr = ext[1].elements['gpxtpx_hr'].to_a
           time1 = $time2
           $time2 = parse_time(elem.elements['time'].to_a.to_s)
           elapsed_time = $time2 - time1
           totaldistance += dist
           $tempfile.puts "#{dist}\t#{elevt[0]}\t#{hr}\t#{elapsed_time}"
         end
}
   $tempfile.puts totaldistance
