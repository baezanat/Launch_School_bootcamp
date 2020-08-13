class Person
  attr_accessor :first_name, :last_name

  def initialize(full)
    parse_name(full)
  end

  def name
    @name = @first_name + ' ' + @last_name
  end

  def last_name=(last)
    @last_name = last
  end

  def name=(full)
    parse_name(full)
  end

  private

  def parse_name(full)
    self.first_name = full.split.first
    self.last_name = full.split[1] ? full.split[1] : ''
  end

end

bob = Person.new('Robert')
p bob.name
p bob.first_name
p bob.last_name
p bob.last_name = 'Smith'
p bob.name

p bob.name = "John Adams"
p bob.first_name
p bob.last_name
