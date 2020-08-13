class Person
  attr_reader :last_name

  def initialize(name)
    @name = name
    @last_name = ''
  end

  def first_name
    name.split.first
  end

  def last_name=(last)
    @last_name = last
  end

  def name
    @name + ' ' + @last_name
  end
end

bob = Person.new('Robert')
p bob.name
p bob.first_name
p bob.last_name
p bob.last_name = 'Smith'
p bob.name
