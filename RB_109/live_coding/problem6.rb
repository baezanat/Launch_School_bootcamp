# You are given an array which contains only integers (positive
# and negative). Your job is to sum only the numbers that are
# the same and consecutive. The result should be one array.
# 
# You can assume there is never an empty array and there will
# always be an integer.
#  
# Examples:
# ---------
# sum_consecutives([1,4,4,4,0,4,3,3,1]) == [1,12,0,4,6,1]
# sum_consecutives([1,1,7,7,3]) == [2,14,3]
# sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]
# sum_consecutives([1]) == [1]
# sum_consecutives([-1]) == [-1]

=begin
INPUT: array of integers
OUTPUT: array of integers (equal or smaller in size)
RULES:
  - Input integers can be positive or negative
  - sm numbers that are the same and consecutive
  - no empty arrays
  - array with a single element returns that element
DATA STRUCTURE: arrays
ALGORITHM:
  - initiate an empty result array
  - Loop over the array keeping track of index and find consecutive repeated integers
    - if number == number[index+1] , use inject to get a sum and add that to results array and index + 1
    - otherwise add the number to results array
  - Return results array
=end

def sum_consecutives(arr)
  result = []
  counter = 0
  loop do
    if arr[counter] == arr[counter + 1]
      result << [arr[counter]].sum(arr[counter + 1])
      counter += 1
    elsif
      counter > 0 && arr[counter] == arr[counter - 1]
      result << [result.pop].sum(arr[counter])
    else
      result << arr[counter]
    end
    counter += 1
    break if counter == arr.size
  end
  result
end

#p sum_consecutives([1, 2, 2])
p sum_consecutives([1,4,4,4,0,4,3,3,1]) #== [1,12,0,4,6,1]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]
p sum_consecutives([1]) == [1]
p sum_consecutives([-1]) == [-1]
