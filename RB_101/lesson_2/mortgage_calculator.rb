# Define methods
def monthly_payment(p, j, n)
  p * (j / (1 - (1 + j)**(-n)))
end

def valid?(num)
  Float(num) || Integer(num) rescue false
end

# Set variables
amount = nil
loan_amount = nil
int_rate = nil
loan_duration = nil

puts '>> Welcome to the Mortgage Calculator!'

loop do
  # Ask for loan amount and validate entry
  puts '>> Enter the dollar amount you need to borrow:'
  loop do
    amount = gets.chomp
    if valid?(amount) && amount.to_f > 0
      loan_amount = amount.to_f
      break
    end
    puts '>> Invalid entry. Try again.'
  end

  # Ask for APR (annual percentage rate)
  puts '>> Enter the APR (annual percentage rate) on your loan:'

  # Validate apr, transform to monthly and to decimal
  loop do
    apr = gets.chomp
    if valid?(apr) && apr.to_f > 0
      int_rate = apr.to_f / 1200
      break
    end
    puts '>> Invalid entry. Try again.'
  end

  # Ask for loan duration and transform to months
  puts '>> Enter the duration of your loan in years:'

  # Validate entry and transform to months
  loop do
    years = gets.chomp
    if valid?(years)
      loan_duration = years.to_f * 12
      break
    end
    puts '>> Invalid entry. Try again.'
  end

  result_full = monthly_payment(loan_amount, int_rate, loan_duration)
  result = format('%.2f', result_full)

  # Return monthly payment
  puts ">> Your monthly payment is #{result}."

  # Ask if they want to make another calculation.
  puts ">> Do you want to make another calculation? ('y' to continue)"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

puts '>> Thank you for using the Mortgage Calculator. Good bye!'
