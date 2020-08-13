numbers = [7, 9, 13, 25, 18]
count = 0

=begin
loop do
  puts numbers[count]
  count += 1
  break if count > 4
end
=end

until count == numbers.length
  puts numbers[count]
  count += 1
end