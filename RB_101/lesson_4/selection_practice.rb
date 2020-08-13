produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}


def select_fruit(hash)
  selected = []
  counter = 0
  loop do
    break if counter > hash.size
    if hash.values[counter] == 'Fruit'
      selected << [hash.keys[counter], hash.values[counter]]
    end
    counter += 1
  end
  selected.to_h
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
