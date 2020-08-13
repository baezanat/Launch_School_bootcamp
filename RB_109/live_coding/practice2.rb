# A stream of data is received and needs to be reversed.
# 
# Each segment is 8 bits long, meaning the order of these
# segments needs to be reversed, for example:
# 
# 11111111  00000000  00001111  10101010
# (byte1)   (byte2)   (byte3)   (byte4)
# 
# should become:
# 
# 10101010  00001111  00000000  11111111
# (byte4)   (byte3)   (byte2)   (byte1)
# 
# The total number of bits will always be a multiple of 8.
# 
# The data is given in an array as such:
# 
# [1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,1,0,1,0,1,0] == [1,0,1,0,1,0,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1]
# [0,0,1,1,0,1,1,0,0,0,1,0,1,0,0,1] == [0,0,1,0,1,0,0,1,0,0,1,1,0,1,1,0]
# [0,0,1,1,0,1,1,0,0,0,1,0,1,0,0,1,0,0,1,1,0,1,1,0,0,0,1,0,1,0,1,1,0,0,1,1,0,1,1,1] == [0,0,1,1,0,1,1,1, 0,0,1,0,1,0,1,1, 0,0,1,1,0,1,1,0, 0,0,1,0,1,0,0,1, 0,0,1,1,0,1,1,0]
=begin
INPUT= array
OUTPUT: array
RULES:
  - The array contains a total number of elements that is a multiple of 8 (segments of 8 digits each)
  - Need to reverse the segments and join them together again in one single array
TEST CASES:

ALGORITHM:
  - Initialize an empty result array
  - Get array slices with 8 elements each
    - Iterate over the array keeping track of index
    - result << array.shift(8)
  - reverse the result array, flatten and return it
=end

def reverse_segments(arr)
  result = []
  (arr.size / 8).times do
    result << arr.shift(8)
  end
  result.reverse
end

p reverse_segments([1, 1, 1, 0, 1, 0, 1, 9, 0, 0, 1, 1, 1, 0, 0, 1])
p reverse_segments([0,0,1,1,0,1,1,0,0,0,1,0,1,0,0,1,0,0,1,1,0,1,1,0,0,0,1,0,1,0,1,1,0,0,1,1,0,1,1,1])

data.each_slice(8).to_a.reverse.flatten
