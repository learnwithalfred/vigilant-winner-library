require 'securerandom'

class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unkown', parent_permission: true)
    @id = SecureRandom.uuid
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  def of_age?
    return true if @age >= 18

    false
  end

  def can_use_services
    return true if is_of_age? || @parent_permission

    false
  end

  private :is_of_age?
end
