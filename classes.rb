class Animal
  def initialize(name)
    @name = name
  end

  def self.animals_count
    3
  end

  def eat
    puts 'Eating'
  end

  def combine_method
    test
  end

  protected
  def test1
    puts 'protected'
  end

  private
  def test
    puts 'private'
  end
end

class Cat < Animal
  # behavior -> methods
  # state -> variables

  def initialize(name, age)
    super(name)
    @age = age
  end

  def call_protected
    test1
  end

  def age
    puts "Cat age is #{@age}"
  end

  def daily_routine
    eat
    sleep
    eat
    sleep
  end

  def eat
    puts 'Cat eats'
  end

  def sleep
    puts 'Meow-meow'
  end
end

class Dog < Animal
  def sleep
    puts 'Bow-wow'
  end
end

tom = Cat.new('Tom', 8)
tom.eat
tom.sleep
tom.age
tom.call_protected
puts tom.inspect

jack = Dog.new('Jack')
jack.eat
jack.sleep

an1 = Animal.new('dfad')
puts Animal.animals_count