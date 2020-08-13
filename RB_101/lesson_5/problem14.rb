hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

#Given this data structure write some code to return an array containing
# the colors of the fruits and the sizes of the vegetables.
# The sizes should be uppercase and the colors should be capitalized.
# The return value should look like this:
# [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

=begin
INPUT: hash with 5 key-value pairs, the values are all hashes
OUTPUT: Array
STRATEGY:
1. Use #each_with_object to iterate over hsh and return an array
2. Current element of iteration is key value pair. Value is inner hash.
3. if value[:type] == 'fruit', push value[:colors] into array and capitalize.
4. if value[:type] == 'vegetable', push value[:size] into array and upcase.

=end

result = hsh.each_with_object([]) do |(key, value), arr|
  if value[:type] == 'fruit'
    arr << value[:colors].map { |color| color.capitalize! } 
  elsif value[:type] == 'vegetable'
    arr << value[:size].upcase!
  end
end

p result
