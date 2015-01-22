def factorial(n)
  if n==0
    1
  else 
    n * factorial(n-1)
  end
end

puts "factorial of 6 is #{factorial(6)}"
class Test
    def times_two(a)
       puts "#{a} times two is #{engine(a)}"
   end
    def engine(b)
      b*2
   end
   private:engine  # this hides engine from users
   end
   
   test = Test.new
   test.times_two(9)
   test.times_two(4)
   