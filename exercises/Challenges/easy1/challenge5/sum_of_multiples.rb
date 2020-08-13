=begin
Write a program that, given a number, can find the sum of all the multiples of particular numbers up to but not including that number.

If we list all the natural numbers up to but not including 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

Write a program that can find the sum of the multiples of a given set of numbers. If no set of numbers is given, default to 3 and 5.
=end

class SumOfMultiples
  attr_reader :mult

  def initialize(*mult)
    @mult = mult.empty? ? [3, 5] : mult
  end

  def self.to(lim, multiples = [3, 5])
    range = (1...lim).to_a
    result = []
    multiples.each do |m|
      range.each do |n|
        result << n if n % m == 0 && !result.include?(n)
      end
    end
    result.sum
  end

  def to(lim)
    self.class.to(lim, mult)
  end
end

