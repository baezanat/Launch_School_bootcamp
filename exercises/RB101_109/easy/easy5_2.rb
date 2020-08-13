=begin
The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. 
If the number of minutes is negative, the time is before midnight.
Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

Examples:
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

INPUT: int (minutes before midnight)
OUTPUT: string ('__:__')
DATA STRUCTURE:
ALGORITHM:
- For positive numbers:
  - if int < 10 return '00:0 int'
  - if 10 <= int < 60 return '00:int'
  - if 60 <= int < 120 return '01:int-60'
  - if 120 <= int < 180 return '02: int-120'
- int.divmod(60) to get an array (x, y) where x is the number of hours and y is the number of minutes.
=end

def time_of_day(int)
  min = 0                                       # => 0,     0,     0,    0,     0,    0,    0
  if int > 0                                    # => false, false, true, false, true, true, false
    min = int % (24 * 60)                       # => 35, 120, 800
  end                                           # => nil,   nil,  35,    nil,  120,   800,   nil
  if int < 0                                    # => false, true, false, true, false, false, true
    min = (24 * 60) - ((-1 * int) % (24 * 60))  # => 1437, 3, 89
  end                                           # => nil,    1437,     nil,     3,      nil,    nil,      89
  arr = min.divmod(60)                          # => [0, 0], [23, 57], [0, 35], [0, 3], [2, 0], [13, 20], [1, 29]
  str_arr = arr.map do |num|                    # => [0, 0], [23, 57], [0, 35], [0, 3], [2, 0], [13, 20], [1, 29]
    num.to_s                                    # => "0", "0", "23", "57", "0", "35", "0", "3", "2", "0", "13", "20", "1", "29"
  end                                           # => ["0", "0"], ["23", "57"], ["0", "35"], ["0", "3"], ["2", "0"], ["13", "20"], ["1", "29"]
  str_arr.map do |str|                          # => ["0", "0"], ["23", "57"], ["0", "35"], ["0", "3"], ["2", "0"], ["13", "20"], ["1", "29"]
    if str.size < 2                             # => true, true, false, false, true, false, true, true, true, true, false, false, true, false
      str.prepend('0')                          # => "00", "00", "00", "00", "03", "02", "00", "01"
    else
      str                                       # => "23", "57", "35", "13", "20", "29"
    end                                         # => "00", "00", "23", "57", "00", "35", "00", "03", "02", "00", "13", "20", "01", "29"
  end                                           # => ["00", "00"], ["23", "57"], ["00", "35"], ["00", "03"], ["02", "00"], ["13", "20"], ["01", "29"]
  return "#{str_arr[0]}:#{str_arr[1]}"          # => "00:00",      "23:57",      "00:35",      "00:03",      "02:00",      "13:20",      "01:29"
end                                             # => :time_of_day

time_of_day(0) == "00:00"      # => true
time_of_day(-3) == "23:57"     # => true
time_of_day(35) == "00:35"     # => true
time_of_day(-1437) == "00:03"  # => true
time_of_day(3000) == "02:00"   # => true
time_of_day(800) == "13:20"    # => true
time_of_day(-4231) == "01:29"  # => true


