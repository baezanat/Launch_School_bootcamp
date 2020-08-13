=begin
Using the multiply method from the "Multiplying Two Numbers" problem, write a method
that computes the square of its argument (the square is the result of multiplying a
number by itself). Example:
square(5) == 25
square(-8) == 64
=end

def multiply(a, b)
  a * b
end

def square(num)
  multiply(num, num)
end

# p square(5)
# p square(-8)

=begin
What if we wanted to generalize this method to a "power to the n" type method: cubed,
to the 4th power, to the 5th, etc. How would we go about doing so while still using the
multiply method?

INPUT: number, power
OUTPUT: number (result of raising number to the power exponent)
REQUIREMENTS: use the multiply method
- What about negative exponents?
STRATEGY:
1. Create a method that takes the number and power
-  If power = 1, the result is multiply(num, 1)
-  If power = 2, the result is multiply(num, num)
-  If power = 3, the result is multiply(multiply(num, num), num)
-  If power = 4, the result is multiply(multiply(multiply(num, num), num), num)
2. Generalizing, 
-  If power = x, the result is multiply(multiply(x-1), x) except for x=1
3. We need a recursive method. Define the case for x=1 and call the recursive function.
=end

def power(num, n)
  if n == 0
    1
  elsif n > 0
    multiply(power(num, n - 1), num)
  else
    1 / power(num, -n).to_f
  end
end

puts "2^1 equals #{power(2, 1)}."
puts "2^2 equals #{power(2, 2)}."
puts "2^3 equals #{power(2, 3)}."
puts "2^4 equals #{power(2, 4)}."
puts "4^0 equals #{power(4, 0)}."
puts "4^-1 equals #{power(4, -1)}."
