=begin
Write a program that asks the user to enter an integer > 0 and then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

Examples:
>> Please enter an integer greater than 0.
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
>> The sum of the integers between 1 and 5 is 15.

>> Please enter an integer greater than 0.
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
>> The product of the integers between 1 and 6 is 720.

INPUT: integer and string ('s' or 'p')
OUTPUT: printed string
DATA STRUCTURES: strings, numbers, arrays
ALGORITHM:
  - puts prompt to enter a number and initialize a variable 'num' to which the user input will be assigned (use #gets.chomp). Change the object assigned to 'num' to an integer.
  - puts prompt to get either 's' or 'p' and initialize a variable called 'operation' to which the user input will be assigned.
  - calculate the sum or product
    - (1..num).inject(:+) if operation == 's'
    - (1..num).inject(:*) if operation == 'p'
  - puts sentence (string) with result.
=end

def calculate
  num = nil
  operation = ''

  loop do
    puts "Please enter an integer greater than 0."
    num = gets.chomp
    break if num.to_i.to_s == num
    puts "Invalid entry."
  end

  loop do
    puts "Enter 's' to compute the sum, 'p' to compute the product."
    operation = gets.chomp
    break if operation == 's' || operation == 'p'
    puts "Invalid entry."
  end

  if operation == 's'
    result = (1..num.to_i).inject(:+)
  elsif operation == 'p' 
    result = (1..num.to_i).inject(:*)
  end

  operation_string = if operation == 's'
                       'sum'
                     else
                       'product'
                     end
  puts "The #{operation_string} of the integers between 1 and #{num} is #{result}."
end

p calculate
