  def isPrime(number)
#     puts number
    if number == 0 or number == 1
      return false
    end
    if number % 5 == 0
      return false
    end
    i = 3
    limit = number / i
#    puts "limit is = #{limit}"
    while i < limit
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
  end
  start_time = Time.now()
  puts "Start time is #{start_time}"
  n = 3
  count = 2
  while n < 1000000
   if isPrime(n)
     count += 1
#     puts "Prime #{n}"
   end
    n += 2
  end
  duration = Time.now() - start_time
puts "total time is #{duration} and count is #{count}"

