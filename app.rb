require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

puts 'Welcome to School Library App!'

# Arrays to store data
@book_arr = []
@person_arr = []

def book_store(book)
  @book_arr.push(book)
  @book_arr
end

def add_student
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'Has parent permission? [Y/N]: '
  perm_input = gets.chomp
  case perm_input.upcase
  when 'Y'
    perm = true
  when 'N'
    perm = false
  else
    puts 'Wrong input!'
    main
  end
  student = Student.new(age, name)
  student.parent_permission = perm
  student.type = 'Student'
  store_person(student)
  success('Student')
end

def store_person(person)
  @person_arr.push(person)
  @person_arr
end

def add_teacher
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  teacher = Teacher.new(age, name)
  print 'Specialization: '
  specialization = gets.chomp
  teacher.specialization = specialization
  teacher.type = 'Teacher'
  store_person(teacher)
  success('Teacher')
end

# Formatters
def success(item)
  puts "#{item} created succesfully!"
end

# Menu Operations
def list_all_books
  @book_arr.map { |book| puts "Title: \"#{book.title}\" Author: #{book.author}" }
  main
end

def list_all_people
  @person_arr.map { |person| puts "[#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  main
end

def create_a_person()
  puts 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
  option = gets.chomp
  case option.to_i
  when 1
    add_student
  when 2
    add_teacher
  else
    puts 'Wrong input !'
  end
  main
end

def create_a_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  book = Book.new(title, author)
  book_store(book)
  success('Book')
  main
end

def create_a_rental
  puts 'Select a book from the following list by number'
  @book_arr.each_with_index { |book, idx| puts "#{idx}) Title: \"#{book.title}\" Author: #{book.author}" }
  book_index = gets.chomp.to_i
  puts 'Select a person from the following list by number (not id)'
  @person_arr.each_with_index do |person, idx|
    puts "#{idx}) [#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
  person_index = gets.chomp.to_i
  print 'Date (yyyy/mm/dd): '
  date = gets.chomp
  person = @person_arr[person_index]
  book = @book_arr[book_index]
  Rental.new(date, person, book)
  success('Rental')
  main
end

def list_rentals_for_id
  print 'ID of person: '
  person_id = gets.chomp.to_i
  person = @person_arr.find { |prsn| prsn.id == person_id }
  rental = person.rentals
  puts 'Rentals:'
  rental.each do |item|
    puts "Date: #{item.date}, Book: #{item.book.title}, by #{item.book.author}"
  end
  main
end
