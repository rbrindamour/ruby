class Point
  def initialize(x,y,elev)
    @x = x
    @y = y
    @elev = elev
  end
  attr_accessor :x, :y, :elev
  def to_s
     "#{x} #{y} #{elev}"
  end
  def add!(a,b,c)
   self.x += a
   self.y += b
   self.elev += c
  end
end
p = Point.new(1,2,3)
puts "P is now #{p}"
p.x, p.y, p.elev = 21,20,19
puts "P is now #{p}"
p.add!(5,5,5)
puts "P is now #{p}"

#q = Point.new(4,5,6)