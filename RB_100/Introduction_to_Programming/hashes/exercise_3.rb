favorites = {Ancient: "Plato",
            Medieval: "Augustine",
            Modern: "Kant",
            Romanticism: "Hegel",
            Phenomenology: "Husserl",
            Critical_Theory: "Marcuse",
            Contemporary: "Boh"}

def print_keys(hash)
  hash.each { |key, value| puts key}
end

def print_values(hash)
  hash.each { |key, value| puts value}
end

puts "Some very important categories in philosophy are:"
print_keys(favorites)
puts "My favorite philosophers in these categories are:"
print_values(favorites)