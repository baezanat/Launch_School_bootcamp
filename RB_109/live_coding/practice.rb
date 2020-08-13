#   No more hiding from your alarm clock! You've decided you want your 
#   computer to keep you updated on the time so you're never late again. 
#   A talking clock takes a 24-hour time and translates it into words.
  
#   Input Description
  
#   An hour (0-23) followed by a colon followed by the minute (0-59).
  
#   Output Description
  
#   The time in words, using 12-hour format followed by am or pm.
  
#   Sample Input data
  
#   00:00
#   01:30
#   12:05
#   14:01
#   20:29
#   21:00
#   Sample Output data
  
#   It's twelve am
#   It's one thirty am
#   It's twelve oh five pm
#   It's two oh one pm
#   It's eight twenty nine pm
#   It's nine pm

=begin
INPUT: string (2 digits + ':' + 2 digits)
OUTPUT: string with sentence written out
TEST CASES:
alarm_clock(00:00) == 'It's twelve am'
alarm_clock(01:30) == 'It's one thirty am'
alarm_clock(12:05) == 'It's twelve oh five pm'
alarm_clock(14:01) == 'It's two oh one pm'
alarm_clock(20:29) == 'It's eight twenty nine pm'
alarm_clock(21:00) == 'It's nine pm'

RULES:
  - output in 12-hour format
  - written out numbers
  - For minutes, if min < 10 output should be prepended by 'oh'
  - append 'am' or 'pm'
  - 00:00 should return 'It's twelve am'

ALGORITHM:
  - Write a conversion hash from digits to written_out_numbers.
  - Write separate methods to get the hours_written_out and the minutes_written_out.
  - Don't forget to append am or pm

  Hours
  - input: string, conversion hash
  - string.split(':')[0] = hours_string
  - hours_int = hours_string.to_i
  - if hours_int >= 0 && hours_int < 1
      hours_written_out = 'twelve'
    elsif hours_int < 13
      hours_written_out = conversion[hours_int]
    elsif hours_int >= 13
      hours_written_out = conversion[hours_int-12]
  - return hours_written_out

  Minutes
  - input: string, conversion hash
  - min_string = string.split(':')[1]
  - min_int = min_string.to_i
  - if min < 10
      min_written_out = 'oh ' + conversion[min_int]
    elsif min <= 20
      min_written_out = conversion[min_int]
    else
      min_written_out = conversion[(min_string[0] + '0').to_i] + '-' + conversion[min_string[1].to_i]
  - return minutes_written_out

  Time (main method)
  - input: string, conversion hash
  - initialize am_or_pm = 'am'
  - if string.split(':')[0].to_i >= 12
      am_or_pm = 'pm'
  - Use concatenation to return string "It's hours_written_out + min_written_out + am_or_om" 

=end

CONVERSION = {
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen',
  20 => 'twenty',
  30 => 'thirty',
  40 => 'forty',
  50 => 'fifty'
}

def hours(string)
  hours_string = string.split(':')[0]
  hours_int = hours_string.to_i
  if hours_int >= 0 && hours_int < 1
    hours_written_out = 'twelve'
  elsif hours_int < 13
    hours_written_out = CONVERSION[hours_int]
  elsif hours_int >= 13
    hours_written_out = CONVERSION[hours_int - 12]
  end
  hours_written_out
end

def minutes(string)
  min_string = string.split(':')[1]
  min_int = min_string.to_i
  min_written_out = nil
  if min_int == 0
    return ''
  elsif min_int < 10
    min_written_out = 'oh ' + CONVERSION[min_int]
  elsif min_int <= 20 || min_int == 30 ||
        min_int == 40 || min_int == 50
    min_written_out = CONVERSION[min_int]
  else
    first_part = CONVERSION[(min_string[0] + '0').to_i]
    second_part = CONVERSION[min_string[1].to_i]
    min_written_out = first_part + ' ' + second_part
  end
  min_written_out
end

def alarm_clock(string)
  am_or_pm = 'am'
  hours_string = string.split(':')[0]
  hours_int = hours_string.to_i
  am_or_pm = 'pm' if hours_int >= 12
  if minutes(string) == ''
    "It's #{hours(string)} #{am_or_pm}"
  else
    "It's #{hours(string)} #{minutes(string)} #{am_or_pm}"
  end
end

p alarm_clock('00:00') == "It's twelve am"
p alarm_clock('01:30') == "It's one thirty am"
p alarm_clock('12:05') == "It's twelve oh five pm"
p alarm_clock('14:01') == "It's two oh one pm"
p alarm_clock('20:29') == "It's eight twenty nine pm"
p alarm_clock('21:00') == "It's nine pm"
