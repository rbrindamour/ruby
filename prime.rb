<<<<<<< HEAD
puts RUBY_VERSION  
=======
>>>>>>> 362aa2e211e227fbad6d40c2a79f4ee71123d71d
  def isPrime(number)
#     puts number
    if number == 0 or number == 1
      return false
    end
<<<<<<< HEAD
 #   if number % 5 == 0
 #     return false
 #   end
    i = 3
    limit = number / i
#    puts "limit is = #{limit}"
    while i <= limit
=======
    if number % 5 == 0
      return false
    end
    i = 3
    limit = number / i
#    puts "limit is = #{limit}"
    while i < limit
>>>>>>> 362aa2e211e227fbad6d40c2a79f4ee71123d71d
      if number % i == 0
#        puts "i is #{i}"
#        puts "number % i = #{number % i}"
#        puts "#{number} is Not prime!"
        return false
      end
      i += 2
      limit = number / i
    end
#    puts "#{number} is prime!"
    return true
<<<<<<< HEAD
  end #isPrime

  #print("Please enter the number of primes to stop ");instring = gets
    primes_limit = 1000000 #Integer(instring)
  start_time = Time.now()
  puts "Start time is #{start_time}"
  n = 3
  count = 1
  while n <= primes_limit
=======
  end
  start_time = Time.now()
  puts "Start time is #{start_time}"
  n = 3
  count = 2
  while n < 1000000
>>>>>>> 362aa2e211e227fbad6d40c2a79f4ee71123d71d
   if isPrime(n)
     count += 1
#     puts "Prime #{n}"
   end
    n += 2
  end
  duration = Time.now() - start_time
puts "total time is #{duration} and count is #{count}"

