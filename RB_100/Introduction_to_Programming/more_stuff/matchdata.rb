def has_a_b?(string)
  if /b/.match(string) || /B/.match(string)
    puts "There is a 'b' in #{string}."
  else
    puts "There is no 'b' in #{string}."
  end
end

has_a_b?("basketball")
has_a_b?("BING!")
has_a_b?("moonlight")