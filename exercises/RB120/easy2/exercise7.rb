class Pet
  attr_reader :name, :animal

  def initialize(animal, name)
    @animal = animal
    @name = name
  end

  def to_s
    "a #{animal} named #{name}"
  end
end

class Owner
  attr_accessor :adopted_pets, :name

  def initialize(name)
    @name = name
    @adopted_pets = []
  end

  def to_s
    "#{name}"
  end
   
  def number_of_pets
    @adopted_pets.size
  end
end

class Shelter

  def initialize
    @owners = []
    @pets_by_owner = Hash.new
  end

  def adopt(owner, pet)
    owner.adopted_pets << pet
    @owners << owner unless @owners.include?(owner)
  end

  def pets_by_owner
    @owners.each do |owner|
      @pets_by_owner[owner] = owner.adopted_pets
    end
    @pets_by_owner
  end

  def print_adoptions
    pets_by_owner.each do |owner, pets|
      puts ''
      puts "#{owner} has adopted the following pets:"
      pets.each do |pet|
        puts "#{pet}"
      end
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts ''
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
