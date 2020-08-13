a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

single_words = a.map { |words| words.split}
single_words.flatten!
p single_words