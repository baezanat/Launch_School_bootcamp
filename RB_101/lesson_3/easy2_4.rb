advice = "Few things in life are as important as house training your pet dinosaur."
puts "'Dino' not in string" if !advice.include?('Dino')
puts "but 'dino' is!" if advice.match?('dino')
