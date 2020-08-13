=begin
As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight.
If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.
Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively.
Both methods should return a value in the range 0..1439. You may not use ruby's Date and Time methods.

examples:
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

INPUT: string in 24 hour format
OUTPUT: integer (minutes before or after midnight)
DATA STRUCTURE: string -> array -> int
STRATEGY:
  - split string at colon and use #to_i to get an array with two integers (hours, minutes)
  - to get minutes after midnight, hours * 60 + min
  - to get minutes before midnight, 60 * 24 - (minutes after midnight)
=end

def after_midnight(str)
  int_arr = str.split(':').map {|str_num| str_num.to_i}  # => [0, 0], [12, 34], [12, 34], [24, 0]
  ((int_arr[0] % 24)* 60) + int_arr [1]                  # => 0,      754,      754,      0
end                                                      # => :after_midnight

def before_midnight(str)
  if str == '00:00' || str == '24:00'  # => true, false, true
    return 0                           # => 0, 0
  else
  (60 * 24) - after_midnight(str)      # => 686
  end
end                                    # => :before_midnight

after_midnight('00:00') == 0     # => true
before_midnight('00:00') == 0    # => true
after_midnight('12:34') == 754   # => true
before_midnight('12:34') == 686  # => true
after_midnight('24:00') == 0     # => true
before_midnight('24:00') == 0    # => true
