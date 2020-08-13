def has_a_b?(string)
  if string =~ /b/ || string =~ /B/
    puts "We have a match! There is a 'b' in #{string}."
  else
    puts "No match here; there is no 'b' in #{string}."
  end
end

has_a_b?("Natalia")
has_a_b?("Baeza")