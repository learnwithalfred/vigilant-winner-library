require_relative 'rental'

class Person
  attr_accessor :id, :name, :age, :type, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1...1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
    @type = type
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end

  private

  def of_age?
    @age >= 18
  end
end
