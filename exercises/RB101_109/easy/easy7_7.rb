=begin
Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

Examples:

show_multiplicative_average([3, 5])
The result is 7.500

show_multiplicative_average([6])
The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
The result is 28361.667
=end

def show_multiplicative_average(arr)
  mult = arr.inject { |total, num| total *= num }  # => 15,  6,   170170
  result = (mult / arr.size.to_f).round(3)         # => 7.5, 6.0, 28361.667
  puts format("%.3f", result)                      # => nil, nil, nil
end                                                # => :show_multiplicative_average

show_multiplicative_average([3, 5])                 # => nil
show_multiplicative_average([6])                    # => nil
show_multiplicative_average([2, 5, 7, 11, 13, 17])  # => nil

# >> 7.500
# >> 6.000
# >> 28361.667
