=begin
Write a program that asks the user to enter an integer greater than 0, then asks
if the user wants to determine the sum or product of all numbers between 1 and the entered integer.
examples:
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.
=end

puts ">> Please enter an integer greater than 0: "
num = gets.chomp.to_i

loop do
  puts ">> Enter 's' to compute the sum of all numbers between 1 and the entered integer,
  or enter 'p' to compute the product."
  operation = gets.chomp

  if operation == 's'
    sum =(1..num).reduce(:+)
    puts ">> The sum of the integers between 1 and #{num} is #{sum}."
    break
  elsif operation == 'p'
    product = (1..num).reduce(:*)
    puts ">> The product of the integers between 1 and #{num} is #{product}."
    break
  else
    puts ">> Invalid entry."
    next
  end
end
