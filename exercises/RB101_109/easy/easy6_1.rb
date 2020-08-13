# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.
# 
# Examples:
#dms(30) == %(30°00'00")
# dms(76.73) == %(76°43'48")
# dms(254.6) == %(254°36'00")
# dms(93.034773) == %(93°02'05")
# dms(0) == %(0°00'00")
# dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
# 
# You may use this constant to represent the degree symbol:
# DEGREE = "\xC2\xB0"
#
# INPUT: float
# OUTPUT: string with degrees, minutes and seconds
# DATA STRUCTURE: array and string
# ALGORITHM:
#  - num.float(0) returns number of degrees(deg)
#  - ((num - deg) * 60).float(0) returns number of min (min)
#  - (((num - deg) * 60) - min) * 60 returns number of sec (sec)-- needs to be rounded
#  - format the answer string
#

DEGREE = "\xC2\xB0"  # => "°"

def f(num)
  sprintf('%02d', num)  # => "43", "48", "35", "60", "02", "05", "00", "00", "00", "00"
end                     # => :f

def dms(num)
  deg = num.floor(0)                               # => 76,           254,           93,           0,           360
  min = ((num - deg) * 60).floor(0)                # => 43,           35,            2,            0,           0
  sec = ((((num - deg) * 60) - min) * 60).round    # => 48,           60,            5,            0,           0
  return %(#{(deg)}#{DEGREE}#{f(min)}'#{f(sec)}")  # => "76°43'48\"", "254°35'60\"", "93°02'05\"", "0°00'00\"", "360°00'00\""
end                                                # => :dms


dms(76.73) == %(76°43'48")                            # => true
dms(254.6) == %(254°36'00")                           # => false
dms(93.034773) == %(93°02'05")                        # => true
dms(0) == %(0°00'00")                                 # => true
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")  # => true
