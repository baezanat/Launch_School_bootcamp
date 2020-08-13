require 'yaml'

MESSAGES = YAML.load_file('calculator_international_messages.yml')
OPERATIONS = {
  'addition'=> '1',
  'multiplication'=> '2',
  'subtraction'=> '3',
  'division'=> '4'
}

def prompt(message)
  puts "\n>> #{message}\n\n"
end

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def retrieve_language
  prompt(messages('language'))
  gets.chomp.downcase
end

def valid_language?(lang)
  lang == 'es' || lang == 'en'
end

def retrieve_name(lang)
  prompt(messages('name', lang))
  gets.chomp
end

def valid_name?(name)
  !name.empty?
end

def greeting(lang, name)
  puts format(messages('greeting', lang), name: name)
end

def retrieve_number(lang, which_number)
  puts format(messages('enter_number', lang), which: which_number)
  gets.chomp
end

def valid_number?(n)
  n.to_f.to_s == n || n.to_i.to_s == n
end

def retrieve_operation(lang)
  prompt(messages('operation_prompt', lang))
  gets.chomp
end

def valid_operation?(op)
  OPERATIONS.values.include?(op)
end

def zero_division(op, num)
  op == OPERATIONS['division'] && num == '0'
end

def operation_to_message(op, lang, number1, number2)
  case op
  when OPERATIONS['addition']
    puts format(messages('addition', lang), n1: number1, n2: number2)
  when OPERATIONS['multiplication']
    puts format(messages('multiplication', lang), n1: number1, n2: number2)
  when OPERATIONS['subtraction']
    puts format(messages('subtraction', lang), n1: number1, n2: number2)
  when OPERATIONS['division']
    puts format(messages('division', lang), n1: number1, n2: number2)
  end
end

def calculation(op, number1, number2)
  case op
    when OPERATIONS['addition']
      number1.to_i + number2.to_i
    when OPERATIONS['multiplication']
      number1.to_i * number2.to_i
    when OPERATIONS['subtraction']
      number1.to_i - number2.to_i
    when OPERATIONS['division']
      number1.to_f / number2.to_f
    end
end

def display_result(res, lang)
  puts format(messages('result', lang), result: res)
end

def continue?(lang)
  prompt(messages('continue', lang))
  answer = gets.chomp.downcase
  answer == 'y' || answer == 'yes'
end

num1 = nil
num2 = nil
operation = nil
name = nil
language = nil

# --------------------MAIN LOOP--------------------------
system("clear")
prompt(messages('welcome'))

loop do
  language = retrieve_language
  break if valid_language?(language)
  prompt(messages('invalid_language'))
end

loop do
  name = retrieve_name(language)
  if valid_name?(name)
    greeting(language, name)
    break
  else
    prompt(messages('invalid_name', language))
  end
end

loop do
  loop do
    num1 = retrieve_number(language, 'first')
    break if valid_number?(num1)
    prompt(messages('invalid_number', language))
  end

  loop do
    num2 = retrieve_number(language, 'second')
    break if valid_number?(num2)
    prompt(messages('invalid_number', language))
  end

  loop do
    operation = retrieve_operation(language)
    if zero_division(operation, num2)
      prompt(messages('zero_division', language))
      next
    elsif valid_operation?(operation)
      operation_to_message(operation, language, num1, num2)
      break
    end
    prompt(messages('invalid_operation', language))
  end

  result = calculation(operation, num1, num2)
  display_result(result, language)

  if continue?(language)
    system("clear")
    next
  else
    break
  end
end

prompt(messages('good_bye', language))
