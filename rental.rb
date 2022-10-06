require_relative 'book'
require_relative 'person'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date)
    @date = date
    @book = nil
    @person = nil
  end

  def book=(book)
    @book = book
    book.add_rental(self)
  end

  def person=(person)
    @person = person
    person.add_rental(self)
  end
end

rental = Rental.new('19/10/2022')
rental.book = book
rental.person = student
puts book.rentals.first.person.name
puts book.rentals.first.book.title
puts book.rentals.first.date
