=begin
Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

Examples;

negative(5) == -5
negative(-3) == -3
negative(0) == 0 
=end

def negative(num)
  num <= 0 ? num : num * -1  # => -5, -3, 0
end                          # => :negative

negative(5) == -5   # => true
negative(-3) == -3  # => true
negative(0) == 0    # => true
