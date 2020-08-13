USER_NAME = "XxxX"
PASSWORD = "SecreT"

loop do
  puts "Please enter user name: "
  user_name_try = gets.chomp
  puts "Please enter password: "
  password_try = gets.chomp
  if user_name_try == USER_NAME && password_try == PASSWORD
    break
  end
  puts "Invalid user name or password. "
end

puts "Welcome!"