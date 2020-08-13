=begin
Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

Examples

swap_name('Joe Roberts') == 'Roberts, Joe'
=end

def swap_name(str)
  name_arr = str.split              # => ["Joe", "Roberts"]
  "#{name_arr[1]}, #{name_arr[0]}"  # => "Roberts, Joe"
end                                 # => :swap_name

swap_name('Joe Roberts') == 'Roberts, Joe'  # => true

def swap_name_2(str)
  str.split.reverse.join(, )
end
