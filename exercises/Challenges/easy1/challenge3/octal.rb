class Octal
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def to_decimal
    return 0 if num.chars.any? { |n| ! %w(0 1 2 3 4 5 6 7).include?(n) }
    num.chars.reverse.map.with_index { |base, idx| base.to_i * 8 ** idx }.inject(:+)
  end

end
