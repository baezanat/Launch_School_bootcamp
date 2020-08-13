=begin
Write a method that will generate random english math problems. The method should take a length, then return a math phrase with that many operations.

Example:

p mathphrase(1) => 'five minus two'
p mathphrase(2) => 'two plus three times eight'
p mathphrase(3) => 'one divided by three plus five times zero'

INPUT: integer (num)
OUTPUT: string
RULES:
  - input integer is equal to the number of words from OPERATOR in output string
  - the first and last elements in output string are always numbers (from NUMBER)
  - element at index 0 will always be from NUMBERS
  - elements at odd indexes will be from OPERATOR
  - last element will be from NUMBERS and will be located at index num r * 2.
ALGORITHM:
  . initialize empty result array
  - enter random elements from NUMBERS at all even indexes in the result array up to index num * 2.
    - iterate over (0..num*2) with Array#each
      and if the current element of interation is even, 
      result[element of iteration] = NUMBERS.sample
  - enter random elements from OPERATORS at odd indexes in result array up to index num * 2 -1
    - iterate over (0..num*2) with Array#each
      and if the current element of interation is odd,
      result[element of iteration] = OPERATORS.sample
  - if the result array includes "divided", insert "by" at the index of "divided" + 1
    - occurrences_of_divided = result.count('divided')
      occurrences_of_divided.times do
      result.insert(result.index('divided') + 1, 'by')
  - return result array joined with a space (string object)
=end

NUMBERS = %w(zero one two three four five six seven eight nine ten)
OPERATORS = %w(plus minus times divided)

def mathphrase(num)
  result = []
  (0..num * 2).each do |n|
    result[n] = NUMBERS.sample if n.even?
    result[n] = OPERATORS.sample if n.odd?
  end
  result.each_with_index do |word, index|
    if word == 'divided'
      result.insert(index + 1, 'by')
    end
  end
  result.join(' ')
end

#p mathphrase(5)
#p mathphrase(1)# => 'five minus two'
#p mathphrase(2)# => 'two plus three times eight'
#p mathphrase(3)# => 'one divided by three plus five times zero'

# Write a method that will generate random english math problems of varying lengths.

def random_mathphrase
  length = rand(5) + 1
  numbers = []
  numbers.fill(0..length) { |i| NUMBERS.sample }
  operations = []
  operations.fill(0..length - 1) { |i| OPERATORS.sample }
  result = numbers.zip(operations).flatten[0...-1]
  result.join(' ').gsub('divided', 'divided by')
end

p random_mathphrase
