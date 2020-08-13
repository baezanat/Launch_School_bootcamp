random_num = []
count = 0

=begin
loop do
  random_num << rand(100)
  count += 1
  break if count == 5
end
=end

while random_num.length < 5
  random_num << rand(100)
end

p random_num