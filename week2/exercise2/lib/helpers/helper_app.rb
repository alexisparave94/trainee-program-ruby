# Module for Helpers of app class
module HelperApp
  # Method to show the promp of the type of vehicle
  def select_vehicle_type
    puts "\nWhat type of vehicle you want to add?"
    puts '1. Car | 2. Truck'
    print 'Enter the number of the option > '
    gets.chomp.to_i
  end

  # Method to ask for an input
  def get_input(prompt)
    input = ''
    while input.empty?
      print prompt
      input = gets.chomp
    end
    input
  end

  # Method to print main menu
  def print_main_menu
    puts 'Choose the option you want to do'
    puts '1. List vehicles'
    puts '2. Add a vehicle'
    puts '3. Remove a vehicle'
    puts '4. Generate quote'
    puts '5. Exit'
  end

  # Method to list all the extras posible
  def list_extras
    puts 'Extras:'
    i = 0
    Extra::PRICES_EXTRAS.each do |extra, price|
      i += 1
      puts "#{i}. #{extra}: $#{price}"
    end
  end
end
