=begin
Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.
Example:
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]

ALGORITHM:
  - Initiate a result array
  - Iterate over array
  - for each subarray, subarray[1].times push subarray[0] into result array
=end

def buy_fruit(arr)
  result = []                                    # => []
  arr.each do |subarray|                         # => [["apples", 3], ["orange", 1], ["bananas", 2]]
    subarray[1].times { result << subarray[0] }  # => 3, 1, 2
  end                                            # => [["apples", 3], ["orange", 1], ["bananas", 2]]
  result                                         # => ["apples", "apples", "apples", "orange", "bananas", "bananas"]
end                                              # => :buy_fruit

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]  # => true

# another possibility:

def buy_fruit_2(arr)
  arr.map { |fruit, quantity| [fruit] * quantity }.flatten  # => ["apples", "apples", "apples", "orange", "bananas", "bananas"]
end                                                         # => :buy_fruit_2

buy_fruit_2([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]  # => true
