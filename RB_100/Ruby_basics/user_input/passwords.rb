PASSWORD = 'SecreT'

loop do
  puts "Please enter your password: "
  entry = gets.chomp
  if entry == PASSWORD
    puts "Welcome!"
    break
  else
    puts "Invalid entry. "
  end
end

