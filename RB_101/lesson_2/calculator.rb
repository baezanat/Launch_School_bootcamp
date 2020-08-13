require 'pry'
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
puts MESSAGES.inspect

def prompt(message)
  puts ">> #{message}"
end

def valid_number?(n)
  Float(n) || Integer(n) rescue false
end

def operation_to_message(op)
  case op
  when '1'
    "Adding "
  when '2'
    "Multiplying "
  when '3'
    "Subtracting "
  when '4'
    "Dividing "
  end
end

num1 = nil
num2 = nil
operation = nil
name = nil

prompt(MESSAGES['welcome'])

loop do
  prompt(MESSAGES['name'])
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES['valid_name'])
    next
  end
  break
end

puts format(MESSAGES['greeting'], name: name)

loop do
  loop do
    prompt(MESSAGES['first_number'])
    num1 = gets.chomp
    if valid_number?(num1)
      break
    end
    prompt(MESSAGES['invalid_number'])
  end

  loop do
    prompt(MESSAGES['second_number'])
    num2 = gets.chomp
    if valid_number?(num2)
      break
    end
    prompt(MESSAGES['invalid_number'])
  end

  operation_prompt = <<-MSG
  What operation would you like to perform? Enter:
  '1' for add',
  '2' for ' multiply',
  '3' for 'subract',
  '4' for 'divide'.
  MSG

  prompt(operation_prompt)

  loop do
    operation = gets.chomp
    if operation == '4' && num2 == '0'
      prompt(MESSAGES['zero_division'])
      next
    elsif ['1', '2', '3', '4'].include?(operation)
      break
    end
    prompt(MESSAGES['invalid_operation'])
  end

  prompt("#{operation_to_message(operation)} the two numbers...")

  result =
    case operation
    when '1'
      num1.to_i + num2.to_i
    when '2'
      num1.to_i * num2.to_i
    when '3'
      num1.to_i - num2.to_i
    when '4'
      num1.to_f / num2.to_f
    end

  puts format(MESSAGES['result'], result: result)
  prompt(MESSAGES['continue'])
  answer = gets.chomp.downcase
  break unless answer == 'y' || answer.start_with?('y')
end

prompt(MESSAGES['good_bye'])
