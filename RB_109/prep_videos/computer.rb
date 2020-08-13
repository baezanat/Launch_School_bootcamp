=begin
Write a computer method that takes an English phrase and returns the value.

Examples:
computer('two plus two') == 4
computer('seven minus six') == 1
computer('zero plus eight') == 8

INPUT: string
OUTPUT: integer
RULES:
  - translate the English sentence into an operation, compute it, and return the result.
  - no 'tricky' sentences
ALGORITHM:
  - write a conversion hash
  - split into strings and save first word as num1, second as operation, third as num2
  - calculate result and return
=end

# p computer('two plus two') == 4
# p computer('seven minus six') == 1
# p computer('zero plus eight') == 8
# p computer('two times three') == 6
# p computer('eight divided two') == 4
# p computer('hello') == nil

# ============
# modify the method on the basis of the following test cases:
# computer('two plus two minus three') == 1
# computer('three minus one plus five minus four plus six plus 10 minus 4') == 15

# Create an array words with each word in the input string
# Create an array of numbers by iterating over words (keeping track of index), convertng all even-indexed elements using the hash and appending the resulting digits to a numbers array.
# Create an array of operations by iterating over words (keeping track of index), converting all odd-numbered elements using the hash and appending the resulting strings to an operations array.
# define the operation using a case statement and the variables num1, num2, operation.
# Iterate over numbers array and over operation array and use inject?

# =============
# Change your method so it can handle the following:
# computer('one plus four times three divided by two minus two') == 5
# computer('seven times four plus one divided by three minus two') == 26
# computer('nine divided by three times six') == 18
#
# We need to add the times and divided by operations to the calculate method
# we need to adjust the computer method to be able to handle precedence of operations
#   - perform all operations with 'times' and 'divided by' first
#   - then loop as before with sums and subtractions

CONVERSION = {'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9, 'ten' => 10}

def calculate(num1, operation, num2)
  case operation
  when 'plus'
    num1 + num2
  when 'minus'
    num1 - num2
  when 'times'
    num1 * num2
  when 'divided_by'
    num1 / num2
  else
    puts 'Error'
  end
end

def computer(str)
  new = str.gsub('divided by', 'divided_by')
  words = new.split
  numbers = []
  operations = []
  words.each_with_index do |word, "index|
    if index.even?
      numbers << CONVERSION[word]
    end
  end
  words.each_with_index do |word, index|
    if index.odd?
      operations << word
    end
  end
  if operations.include?('times') || operations.include?('divided_by')
    iterations = operations.count('times') + operations.count('divided_by')
    # puts "number of iterations for times and divided_by is #{iterations}"
    iterations.times do
      if operations.index('times') == nil
        index = operations.index('divided_by')
      elsif operations.index('divided_by') == nil
        index = operations.index('times')
      else 
        index = [operations.index('times'), operations.index('divided_by')].min
      end
      # p "index of 'times' is #{operations.index('times')}"
      # p "index of 'divided_by' is #{operations.index('divided_by')}"
      # p "index of first is #{index}"
      # p "operation is #{numbers[index]} #{operations[index]} #{numbers[index + 1]}"
      if numbers[index] != 'x' && numbers[index + 1] != 'x'
        numbers[index] = calculate(numbers[index], operations[index], numbers[index + 1])
        # p "result of operation is #{numbers[index]}"
      elsif numbers[index] == 'x'
        numbers[index - 1] = calculate(numbers[index - 1], operations[index], numbers[index + 1])
        # p "result of operation is #{numbers[index - 1]}"
      end
      numbers[index + 1] = 'x'
      operations[index] = 'x'
      # p "numbers array for next iteration is #{numbers}"
      # p "operations array for next iteration is #{operations}"
    end
    operations.delete('x')
    numbers.delete('x')
    # p "numbers array after mult and div is #{numbers}"
    # p "operations array after mult and div is #{operations}"
  end
  return numbers[0] if numbers.size == 1
  total = calculate(numbers[0], operations[0], numbers[1])
  (operations.size - 1).times do |index|
    total = calculate(total, operations[index + 1], numbers[index + 2])
  end
  total
end

p computer('four plus four times two minus one times one plus four divided by two') == 13
p computer('one plus four times three divided by two minus two') == 5
p computer('seven times four plus one divided by three minus two') == 26
p computer('nine divided by three times six') == 18
p computer('two plus two minus three') == 1
p computer('two plus two') == 4
p computer('seven minus six') == 1
p computer('zero plus eight') == 8
p computer('two plus two minus three') == 1
p computer('three minus one plus five minus four plus six plus ten minus four') == 15

