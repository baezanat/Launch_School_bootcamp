=begin
A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

Examples:

twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

Note: underscores are used for clarity above. Ruby lets you use underscores when writing long numbers; however, it does not print the underscores when printing long numbers. Don't be alarmed if you don't see the underscores when running your tests.
=end

def double_number?(int)
  str = int.to_s                                   # => "37",  "44", "334433", "444", "107", "103103", "3333", "7676", "123456789123456789", "5"
  mid = str.size / 2                               # => 1,     1,    3,        1,     1,     3,        2,      2,      9,                    0
  str.size > 1 && str[0..mid - 1] == str[mid..-1]  # => false, true, false,    false, false, true,     true,   true,   true,                 false
end                                                # => :double_number?

def twice(int)
  if double_number?(int)  # => false, true, false, false, false, true, true, true, true, false
    int                   # => 44, 103103, 3333, 7676, 123456789123456789
  else
    int * 2               # => 74, 668866, 888, 214, 10
  end                     # => 74, 44, 668866, 888, 214, 103103, 3333, 7676, 123456789123456789, 10
end                       # => :twice

twice(37) == 74                                            # => true
twice(44) == 44                                            # => true
twice(334433) == 668866                                    # => true
twice(444) == 888                                          # => true
twice(107) == 214                                          # => true
twice(103103) == 103103                                    # => true
twice(3333) == 3333                                        # => true
twice(7676) == 7676                                        # => true
twice(123_456_789_123_456_789) == 123_456_789_123_456_789  # => true
twice(5) == 10                                             # => true
