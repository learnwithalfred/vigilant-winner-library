require_relative './student'

class Classroom
  attr_accessor :label

  def initialize(label)
    @label = label
    @students = []
  end

  attr_reader :students

  def add_student(student)
    @students << student
    student.classroom = self
  end
end

classroom = Classroom.new('A')
student = Student.new('John')
classroom.add_student(student)
puts classroom.students.first.classroom.label
