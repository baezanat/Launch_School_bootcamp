=begin
Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.

For example, the string "01234" has the following 3-digit series:

- 012
- 123
- 234
And the following 4-digit series:

- 0123
- 1234
And if you ask for a 6-digit series from a 5-digit string, you deserve whatever you get.

Problem
- input: str of digits
- output: array of arrays with integer elements

Algorithm
- Create a `slice` method that operates on a `Series` object
  - define a Series class
  - initialize method with one parameter (string)
  - `slices` instance method whose return is the 2-dimensional array
- `slice` method
  - takes a number as an argument, it's the length of each inner array
  - iterate over each element in the string and slice the given string from the index corresponding to the current number of iteration, for a length designated by the argument passed into the `slice` instance method

=end

class Series
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def slices(n)
    raise ArgumentError, 'string size is too large' if n > string.size
    arr = string.chars.map { |digit| digit.to_i }
    result = []
    counter = 0
    loop do
      result << arr.slice(counter, n)
      counter += 1
      break if counter > arr.size - n
    end
    result
  end
end
