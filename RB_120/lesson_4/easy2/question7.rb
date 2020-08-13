class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

p Cat.cats_count
kitty = Cat.new('persian')
p Cat.cats_count
lovey = Cat.new('bengal')
p Cat.cats_count
nary = Cat.new('balinese')
p Cat.cats_count
