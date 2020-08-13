flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

names_starting_Be = flintstones.select { |name| name.start_with?("Be")}
index_starting_Be = flintstones.index(names_starting_Be[0])
