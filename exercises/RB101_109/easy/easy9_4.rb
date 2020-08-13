=begin
Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.
You may assume that the argument will always be a valid integer that is greater than 0.

Examples:

sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

=end

def sequence(int)
  (1..int).to_a    # => [1, 2, 3, 4, 5], [1, 2, 3], [1]
end                # => :sequence

sequence(5) == [1, 2, 3, 4, 5]  # => true
sequence(3) == [1, 2, 3]        # => true
sequence(1) == [1]              # => true

# Food for thought: what do you think sequence should return if the argument is not greater than 0. For instance, what should you do if the argument is -1? Can you alter your method to handle this case.

def sequence2(num)
  if num > 0        # => false
    sequence(num)
  else
    (num..-1).to_a  # => [-5, -4, -3, -2, -1]
  end               # => [-5, -4, -3, -2, -1]
end                 # => :sequence2

sequence2(-5)  # => [-5, -4, -3, -2, -1]
