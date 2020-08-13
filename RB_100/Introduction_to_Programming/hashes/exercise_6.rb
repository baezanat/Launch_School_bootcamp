words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

#iterate over the words
#split, sort in alphabetical order, join
#if key == sorted word, push original word into hash as 
#value for that key
#otherwise, make the sorted word a new key
#we get a hash with key and value storing sorted versions of key
#print values as different arrays

anagrams = {}

words.each do |word|
  key = word.split("").sort.join
  if anagrams.has_key?(key)
    anagrams[key].push(word)
  else
    anagrams[key] = [key]
  end
end

p anagrams
anagrams.each do |key, value| 
  puts "-------" 
  print value
end