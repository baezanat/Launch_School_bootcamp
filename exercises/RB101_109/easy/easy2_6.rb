=begin
Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.
=end

# (1..99).each {|num| puts num if num.odd?}

1.upto(99) {|num| puts num if num % 2 == 1}
