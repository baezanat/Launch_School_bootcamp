=begin
Problem:
- INPUT, initialize object: string (DNA nucleotides)
  INPUT, `hamming_distance` method: string (DNA nucleotides)
- OUTPUT:  integer

algorithm:
- set counter = 0
- loop over DNA_str.chars keeping track of index (#each_with_index) and increase counter by 1 each time the current element of iteration == string at index
=end

class DNA
  attr_reader :dna_str

  def initialize(dna_str)
    @dna_str = dna_str
  end

  def hamming_distance(str)
    counter = 0
    dna_str.chars.each_with_index do |nucl, idx|
      counter += 1 if nucl != str[idx]
      break if (idx + 1 == dna_str.size) || (idx + 1 == str.size)
    end
    counter
  end
end
