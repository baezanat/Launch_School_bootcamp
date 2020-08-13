=begin
Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:
zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

Examples:
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

=end

NUMBERS= %w(zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen)  # => ["zero,", "one,", "two,", "three,", "four,", "five,", "six,", "seven,", "eight,", "nine,", "ten,", "eleven,", "twelve,", "thirteen,", "fourteen,", "fifteen,", "sixteen,", "seventeen,", "eighteen,", "nineteen"]

def alphabetic_number_sort(arr)
  arr.sort_by do |num|           # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
    NUMBERS[num]                 # => "zero,", "one,", "two,", "three,", "four,", "five,", "six,", "seven,", "eight,", "nine,", "ten,", "eleven,", "twelve,", "thirteen,", "fourteen,", "fifteen,", "sixteen,", "seventeen,", "eighteen,", "nineteen"
  end                            # => [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
end                              # => :alphabetic_number_sort

alphabetic_number_sort((0..19).to_a)  # => [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
