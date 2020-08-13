def number_in_range?(num, first, last)
  if num > first && num < last
    puts "#{num} lies between #{first} and #{last}."
  else 
    puts "#{num} is out of range."
  end
end

number_in_range?(42, 10, 100)

def in_range?(num, first, last)
  if (first..last).include?(num)
    puts "#{num} lies between #{first} and #{last}."
  else 
    puts "#{num} is out of range."
  end
end

in_range?(42, 10, 100)
