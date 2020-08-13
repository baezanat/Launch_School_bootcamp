def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

loop do
  puts "Please enter the numerator: "
  num_1 = gets.chomp
  puts "Please enter the denominator: "
  num_2 = gets.chomp
  if num_2.to_i == 0
    puts "Invalid entry.A denominator of 0 is not allowed"
    next
  end
  if !valid_number?(num_1) || !valid_number?(num_2)
    puts "Invalid entry. Only integers are allowed."
    next
  else
    total = num_1.to_i / num_2.to_i
    puts "The result is #{total}."
    break
  end
  puts "One of the numbers is not valid. Try again."
end

