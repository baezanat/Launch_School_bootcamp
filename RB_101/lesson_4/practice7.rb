statement = "The Flintstones Rock"

# Create a hash that expresses the frequency
# with which each letter occurs in this string
=begin

INPUT: string
OUTPUT: hash {letter => number}

STRATEGY:
- Initiate an empty result hash
- Iterate over each character in the given string
- For each character, iterate to end of string
  - if the character is already in the result hash, increase the value associated
    with the character key by 1
  - If the character is not already in the hash, add it as a key associated with 
    the value 1
  -Break out of the look when the counter = string length (if using a loop)
- Return the result hash

=end

def char_frequency(string)
  frequency = {}
  counter = 0
  loop do
    break if counter == string.length
    current_character = string[counter]
    if current_character == ' '
      counter += 1
      next
    elsif frequency.has_key?(current_character)
      frequency[current_character] += 1
    else
      frequency[current_character] = 1
    end
    counter += 1
  end
  frequency
end

puts char_frequency(statement)
