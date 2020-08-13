=begin
Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.
You may assume that both input Arrays are non-empty, and that they have the same number of elements.
Example:
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
=end
require 'pry'         # => true
require 'pry-byebug'  # => true

def interleave(arr1, arr2)
  new = []                           # => []
  loop do
    new << arr1.shift << arr2.shift  # => [1, "a"], [1, "a", 2, "b"], [1, "a", 2, "b", 3, "c"]
    break if arr1.empty?             # => false,    false,            true
  end                                # => nil
  new                                # => [1, "a", 2, "b", 3, "c"]
end                                  # => :interleave

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']  # => true

# >> true
