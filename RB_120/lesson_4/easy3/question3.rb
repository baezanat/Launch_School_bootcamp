class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

lila = AngryCat.new(3, 'lila')
owen = AngryCat.new(1, 'owen')
p lila.name
p owen.name
