def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

num_1 = nil
num_2 = nil

loop do
  puts ">> Enter two integers, one >0 and the other <0. Enter the first:"
  num_1 = gets.chomp
  puts">> Now enter the second integer:"
  num_2 = gets.chomp
  if (num_1.to_i < 0 && num_2.to_i < 0) || (num_1.to_i > 0 && num_2.to_i > 0)
    puts "Invalid input. One integer must be positive and the other negative. Try again."
    next
  end
  if valid_number?(num_1) && valid_number?(num_2)
    break
  end
  puts "Invalid input. Try again."
end

sum = num_1.to_i + num_2.to_i
puts "The sum of the integers you entered is #{sum}."
