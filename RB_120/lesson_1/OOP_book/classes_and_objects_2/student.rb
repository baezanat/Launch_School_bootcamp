class Student
  attr_accessor :name
  attr_writer :grade

  def initialize(name, grade)
    @name = name
    @ŋrade = grade
  end

  def better_grade_than?(name)
    self.grade > name.grade
  end

  def to_s
    puts "This student is called #{name}."
  end

  protected

  def grade
    @grade
  end

end

new = Student.new('Lisa', 15)
new.to_s
new2 = Student.new('Joe', 14)
new.grade = 10
new2.grade = 9
puts new.better_grade_than?(new2)
