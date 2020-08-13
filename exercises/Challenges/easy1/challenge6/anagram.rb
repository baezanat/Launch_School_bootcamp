class Anagram
  attr_reader :word, :letters

  def initialize(word)
    @word = word.downcase
  end

  def anagram?(str)
    str.downcase.chars.sort == word.chars.sort
  end

  def match(words)
    words.select { |w| anagram?(w) && (w.downcase != word) }
  end
end

