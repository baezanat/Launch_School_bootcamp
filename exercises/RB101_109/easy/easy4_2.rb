=begin
Write a method that takes a year as input and returns the century. The return value should be
a string that begins with the century number, and ends with st, nd, rd, or th as appropriate
for that number. New centuries begin in years that end with 01. 
So, the years 1901-2000 comprise the 20th century. Examples:

century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

INPUT:
  - integer (year)
OUTPUT:
  - string
  - cent number + st, nd, rd, or th
  - century: 01..00
DATA STRUCTURE:
  - integer to determine century number, change to string
  - if statement (rule) to determine suffix
  - return string
STRATEGY:
  - determine century number
    - (01..100) => 1
    - (101..200) => 2
    - (201..300) => 3
    - for n, if n%100 == 0, c = n/100 else c = n/100+1
  - determine correct suffix
    - for x in [11, 12, 13] if year%10 - x == 0, suffix = th
    - elsif year % 10 == 1 => st, 2 => nd, 3 =>rd, else => th
  - concatenate number and suffix and return string
=end
def century_num(year)
  if year % 100 == 0
    century_num = year / 100
  else
    century_num = (year / 100) + 1
  end
  return century_num.to_s
end

def cent_suffix(cent)
  if cent % 10 == 1 && cent.to_s[-2..-1] != '11'
    "st"
  elsif cent % 10 == 2 && cent.to_s[-2..-1] != '12'
    "nd"
  elsif cent % 10 == 3 && cent.to_s[-2..-1] != '13'
    "rd"
  else
    "th"
  end
end

def century(year)
  century_num(year) + cent_suffix(century_num(year))
end

puts "The year 1919 is in the #{century(1919)} century."
puts "The year 1 is in the #{century(1)} century."
puts "The year 2001 is in the #{century(2001)} century."
puts "The year 5 is in the #{century(5)} century."
puts "The year 1919 is in the #{century(1919)} century."
puts "The year 1052 is in the #{century(1052)} century."
puts "The year 1127 is in the #{century(1127)} century."
puts "The year 11201 is in the #{century(11201)} century."
