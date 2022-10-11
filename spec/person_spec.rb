require_relative '../person'
describe Person do
  let(:person) { Person.new(27, 'Josh') }

  describe '#new' do
    it 'create new person' do
      expect(person).to be_a(Person)
    end

    it 'has name' do
      expect(person.name).to eq('Josh')
    end

    it 'has an age' do
      expect(person.age).to eq(27)
    end
  end
end
