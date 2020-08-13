=begin
Write a method that takes two arguments, the first is the starting number, and the second is the ending numbeer. Print out all numbers between the two, except if a number is divisible by 3, print 'Fizz', if it's divisible to 5 print 'Buzz', and if it's divisibl by 3 and 5 print 'FizzBuzz'.

INPUT: two numbers (starting and ending)
OUTPUT: array
RULES:
  - consider all numbers within the range (start..end)
  - if num % 3 == 0  && num % 5 == 0, print 'FizzBuzz'
  - if num % 3 == 0 print 'Fizz'
  - if num % 5 == 0 print 'Buzz'
DATA STRUCTURE: strings, arrays, and digits
ALGORITHM:
  - range_array = (start..end).to_a
  - Initialize a variable and assign to it the return value of iterating over range_array using #map
  - write a case statement with the 3 relevant conditions, checking first if both divisibility by 3 and by 5 are satisfied, so that only if a number does not satisfy both conditions will it be checked for the conditions separately.
  - if num % 3 == 0  && num % 5 == 0, 'FizzBuzz'
  - if num % 3 == 0
      'Fizz'
  - if num % 5 == 0 
       'Buzz'
  - else
      num
  - return new array
=end

def fizzbuzz(start, ending)
  new = (start..ending).map do |num|
    case
    when num % 3 == 0 && num % 5 == 0
      'FizzBuzz'
    when num % 3 == 0
      'Fizz'
    when num % 5 == 0
      'Buzz'
    else
      num
    end
  end
  p new
end

fizzbuzz(1, 15)
