require_relative '../student'

describe Student do
  let(:student) do
    Student.new(25, 'Class 02', 'Josh')
  end
  describe '#new' do
    it 'create new student' do
      expect(student).to be_a(Student)
    end

    it 'should return the correct name' do
      expect(student.name).to eq('Josh')
    end

    it 'should return the correct age' do
      expect(student.age).to eq(23)
    end

    it 'should return the correct classroom' do
      expect(student.classroom).to eq('Class 02')
    end
  end
end
