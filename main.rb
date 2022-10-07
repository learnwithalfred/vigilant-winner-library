require_relative 'app'

def menu
  puts "\nPlease choose an option by entering a number:"
  puts '1 - List all books', '2 - List all people', '3 - Create a person', '4 - Create a book',
       '5 - Create a rental', '6 - List all rentals for a given person id', '7 - Exit'
end

# Menu Selections
@menu_hash = { 1 => method(:list_all_books), 2 => method(:list_all_people), 3 => method(:create_a_person),
               4 => method(:create_a_book), 5 => method(:create_a_rental),
               6 => method(:list_rentals_for_id), 7 => method(:exit) }
def main()
  menu
  selection = gets.chomp.to_i
  if selection.positive? && selection <= 7
    @menu_hash[selection].call
  else
    puts 'Wrong input !'
  end
end

def exit
  puts 'Thanks'
end

main
