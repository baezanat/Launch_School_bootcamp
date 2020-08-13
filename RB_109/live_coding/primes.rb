# Print all the primes between 2 numbers without using the prime class
=begin
INPUT: two integers
OUTPUT: string of numbers separated by a comma
RULES:
  - def: prime is a number divisible only by itself and 1
  - Find all primes between the two given numbers
  - if no primes in the range, return ''
DATA STRUCTURE: strings, arrays, integers
ALGORITHM:
  - create an array from 2 to second input
  - use reject to iterate over the array
  - iterate again using each
  - num2 % num1 == 0
  - make sure that if everything is rejected you return ''
=end


def prime?(num)
  range = (2...num).to_a
  range.each do |n|
    if num % n == 0
      return false
    end
  end
  true
end

def find_primes(int1, int2)
  array = (int1..int2).to_a.select do |num|
    prime?(num)
  end
  puts array.join(', ')
end

find_primes(3, 10) # == '3, 5, 7'
find_primes(3, 7)  # == '3, 5, 7'
find_primes(8, 9)  # == ''
