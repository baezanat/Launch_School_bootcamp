iterations = 1

5.times do
  puts "Number of iterations = #{iterations}"
end

puts "----------------------"

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end