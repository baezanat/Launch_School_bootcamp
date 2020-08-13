flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push('Dino', 'Hoppy')
p flintstones
flintstones.push('x').push('y')
p flintstones
flintstones.concat(%w(more to add))
p flintstones
5.times {flintstones.pop}
p flintstones
