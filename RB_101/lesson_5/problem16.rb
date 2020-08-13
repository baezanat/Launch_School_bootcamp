# Each UUID consists of 32 hexadecimal characters, and is typically broken
# into 5 sections like this 8-4-4-4-12 and represented as a string.
#It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
# Write a method that returns one UUID when called with no parameters.

=begin
INPUT: description of UUID string
OUTPUT: method to return a UUID

STRATEGY:
1. Create a string with character options for the UUID
2. Create a method that randomly chooses a character from the options string
  - Randomly choose a number b/n 0 and 15 using the rand(max) method.
  - Return the character from the options string with this random index.
3. Create a method that calls the previous method in the required order
   and attaches each character to the result string.

=end

def create_uuid()
  options = ''
  (0..9).each {|num| options << num.to_s}
  ('a'..'f').each {|letter| options << letter}

  uuid = ''
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times {uuid << options[rand(16)]}
    uuid << '-' unless index == sections.size - 1
  end
  uuid
end

p create_uuid
