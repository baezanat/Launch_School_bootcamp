PRODUCTS = [
{name: "Thinkpad x210", price: 220},
{name: "Thinkpad x220", price: 250},
{name: "Thinkpad x250", price: 979},
{name: "Thinkpad x230", price: 300},
{name: "Thinkpad x230", price: 350},
{name: "Thinkpad x230", price: 350},
{name: "Thinkpad x240", price: 700},
{name: "Mackbook Leopard", price: 300},
{name: "Macbook Air", price: 700},
{name: "Mackbook Pro", price: 600},
{name: "Mackbook", price: 1449},
{name: "Dell Latitude", price: 200},
{name: "Dell Latitude", price: 650},
{name: "Dell Inspiron", price: 300},
{name: "Dell Inspiron", price: 450}
]

query = {
  price_min: 240,
  price_max: 280,
  q: 'thinkpad'
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: 'dell'
}

def search(query)
  PRODUCTS.select do |hash|
    hash[:name].downcase.include?(query[:q]) && (query[:price_min]..query[:price_max]).include?(hash[:price])
  end
end

search(query) # => [{:name=>"Thinkpad x220", :price=>250}]
search(query2) # => [{:name=>"Dell Inspiron", :price=>300}, {:name=>"Dell Inspiron", :price=>450}]

# INPUT: hash (query)
# OUTPUT: array
# DATA STRUCTURE: array and hash
# ALGORITHM:
#   - PRODUCTS is an array with hash elements
#   - query is a hash
#   - We will look for products within a certain price range defined by query[:price_min] to query[:price_max]
#   - We want the brand defined by query[:q]
#   - We need to iterate over PRODUCTS and select the hashes that satisfy the criteria
#   - Use Array#select with a block that returns true if the hash satisfy the criteria and false otherwise
#   - block: hash[:name] == query[:q] && (query[:price_min]..query[:price_max]).include?(hash[:price])
# 
# TEST CASES:
# search(query)
# => [{:name=>"Dell Inspiron", :price=>300},
#     {:name=>"Dell Inspiron", :price=>450}]

# search(query2)
# => [{:name=>"Dell Inspiron", :price=>300},
#     {:name=>"Dell Inspiron", :price=>450}]
#

