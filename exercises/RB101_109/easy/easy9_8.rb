=begin
Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

Examples:

sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []
=end

def sequence(count, first)
  (1..count).map { |num| num * first }  # => [1, 2, 3, 4, 5], [-7, -14, -21, -28], [0, 0, 0], []
end                                     # => :sequence

sequence(5, 1) == [1, 2, 3, 4, 5]       # => true
sequence(4, -7) == [-7, -14, -21, -28]  # => true
sequence(3, 0) == [0, 0, 0]             # => true
sequence(0, 1000000) == []              # => true
