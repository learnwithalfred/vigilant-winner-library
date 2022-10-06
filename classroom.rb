require_relative 'student'

class Classroom
  attr_reader :students
  attr_accessor :label

  def initialize(label)
    @label = label
    @student = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end

classroom = Classroom.new('Maths Class')
puts classroom.students
