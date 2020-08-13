=begin
PROBLEM:
  - Get a list of primes up to n
  - input: n
  - output: array of integers

ALGORITHM:
  - Range = (2..n)
  - not_prime = []
  - Iterate over Range and, for each number, iterate again over Range and multiply the current number of the outer iteration by each of the numbers in the inner loop, adding the product to `not_prime'. Break the inner loop when the product is greater than the last number in Range.
  - return all the numbers in Range that are not in `not_prime`
=end

# class Sieve
#   attr_accessor :n
# 
#   def initialize(n)
#     @n = n
#   end
# 
#   def primes
#     range = (2..n).to_a
#     not_prime = []
#     range.each do |number|
#       range.each do |num|
#         not_prime << number * num
#         break if number * num > range[-1]
#       end
#     end
#     range - not_prime
#   end
# end

class Sieve
  attr_accessor :n

  def initialize(n)
    @n = n
  end

  def primes
    range = (2..n).to_a
    state = range.dup.fill('unmarked')
    primes = range.zip(state).to_h
    range.each do |num|
    
    end
  end
end

p Sieve.new(5).primes
