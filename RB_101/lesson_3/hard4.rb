def is_an_ip_number?(string)
  (0..255).include?(string.to_i)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.size != 4
    puts "Invalid entry; there should be only 4 components separated by a dot."
    return false
  end
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    if !is_an_ip_number?(word)
      puts "Invalid entry, not an IP address."
      return false
    else next
    end
  end
  puts "This is an IP address."
  return true
end

dot_separated_ip_address?('1234.3.2') #=> Not an IP address
dot_separated_ip_address?('4.5.55') #=> Not an IP address
dot_separated_ip_address?('1.2.3.4.5') #=> Not an IP address
dot_separated_ip_address?('3.55.200.1') #=> Yes! an IP address!

# You're not returning a false condition, and you're not handling
  # the case that there are more or fewer than 4 components to the
  # IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid).
