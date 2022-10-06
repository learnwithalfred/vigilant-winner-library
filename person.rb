require 'securerandom'
require_relative 'nameable'
require_relative 'capitalize'
require_relative 'trimmer'
require_relative 'decorator'

class Person < Nameable
  attr_accessor :name, :age, :id
  attr_reader :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = SecureRandom.uuid
    super()
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def capitalize
    @name.capitalize
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end

  private :of_age?
end
