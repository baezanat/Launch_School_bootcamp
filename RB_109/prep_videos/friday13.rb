=begin
Write a method that returns the number of Friday the 13ths in the year passed in as an argument. You may assume that the year is greater than 1752 (when the modern Gregorian calendar was adopted by the UK) and you may assume that the same calendar will remain in use for the foreseeable future.
Examples:
friday_13th?(2015) == 3
friday_13th?(1986) == 1
=end

require 'date'

def friday_13th(year)
  weekdays = (1..12).map do |month|
    Date.new(year, month, 13).cwday
  end
  weekdays.count(5)
end

friday_13th(2015) # => 3
friday_13th(1986) # => 1
