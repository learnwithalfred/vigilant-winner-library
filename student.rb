require_relative 'person'

class Student < Person
  def initialize(age, classroom, name = 'Unknow', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end