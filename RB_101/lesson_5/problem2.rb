books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

# order this array of hashes based on the year of publication of each book,
# from the earliest to the latest
=begin
INPUT: Array with 4 inner hashes
OUTPUT: Same hash, sorted
*** Need to return the same object or a new one?

STRATEGY:
1. Iterate over the array.
   element1 = each inner hash
2. publication_year = element1[:published]
3. sort by publication_year using the block: do |a, b| a.to_i <=> b.to_i
    
=end
   
books.sort_by! do |inner_array|
  inner_array[:published].to_i
end
p books
