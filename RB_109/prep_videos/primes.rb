=begin
Write a method that takes two numbers. It should print out all primes between the two numbers. Don't use Ruby's prime class
ex:
find_primes(3, 10) == 3, 5, 7

INPUT: two integers
OUTPUT: string (come-separated numbers)
RULES:
  - print out all primes between the two given numbers
  - no primes in range --> return ''
  - no negative numbers?
DATA STRUCTURE: integers, arrays, strings
ALGORITHM:
  - write two methods, one to determine whether a number is prime, another to find all primes within given range.
  - determine whether a number is prime (prime?):
    - input: num
    - make an array from 1 to num (not inclusive)
    - iterate over array using Array#all? to see if !num % current == 0
    - if true, the number is prime. If false, it is not prime.
  - second method looks for all primes within a range
    - input: num1, num2
    - make an array from num1 to num2 (inclusive)
    - use Array#select to iterate over the array checking to see if any of the numbers are primes using the prime? method. Save the new array to a new variable result.
    - use Array#join to return a string
=end

def prime?(num)
  (2...num).to_a.all? do |n|
    !(num % n == 0)
  end
end

def find_primes(num1, num2)
  result = ((num1..num2).to_a.select do |num|
    prime?(num)
  end)
  result.join(', ')
end

p find_primes(3, 10)
