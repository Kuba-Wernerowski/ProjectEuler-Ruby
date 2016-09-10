# The sequence of triangle numbers is generated by adding the natural numbers.
#  So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28.
#The first ten terms would be:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# Let us list the factors of the first seven triangle numbers:

# 1: 1
# 3: 1,3
# 6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# We can see that 28 is the first triangle number to
# have over five divisors.

# What is the value of the first triangle number to
# have over five hundred divisors?

start_time = Time.now

def divisors(number)
  divisors = []
  (1..number ** 0.5).each do |num|
    divisors << num if number % num == 0
  end
  (0...divisors.length).each do |index|
    divisors << number / divisors[index]
  end
  return divisors.length
end

def triangle_numbers
  natural_number = 1
  tri_number = 0
  until divisors(tri_number) > 500
    tri_number += natural_number
    natural_number += 1
  end
  return tri_number
end

puts "result #{triangle_numbers} returned in #{Time.now - start_time} seconds"
