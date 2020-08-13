=begin
Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.
examples:
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}
=end

# def word_sizes(str)
#   count = Hash.new(0)
#   str.split.each do |word|
#     word.gsub!(/[^a-z]/i, '')
#     count[word.size] += 1
#   end
#   count
# end
# 
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# word_sizes('') == {}

ALPHABET = ('a'..'z').to_a << " "  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

def cleanup(text)
  text.downcase!                                     # => "hey diddle diddle, the cat and the fiddle!"
  text.each_char do |chr|                            # => "hey diddle diddle, the cat and the fiddle!"
    text.delete!(chr) unless ALPHABET.include?(chr)  # => nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "hey diddle diddle the cat and the fiddle!", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "hey diddle diddle the cat and the fiddle"
  end                                                # => "hey diddle diddle the cat and the fiddle"
end                                                  # => :cleanup

def word_sizes(string)
  clean_string = cleanup(string)                                            # => "hey diddle diddle the cat and the fiddle"
  words_lengths = clean_string.split.map { |word| word.length }             # => [3, 6, 6, 3, 3, 3, 3, 6]
  words_lengths.uniq.inject({}) { |h, k| h[k] = words_lengths.count(k); h}  # => {3=>5, 6=>3}
end                                                                         # => :word_sizes


#word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }  # => true
#word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
#word_sizes('') == {}
