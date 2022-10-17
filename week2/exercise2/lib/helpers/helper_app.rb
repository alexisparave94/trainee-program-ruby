module HelperApp
  def select_vehicle_type
    puts "\nWhat type of vehicle you want to add?"
    puts '1. Car | 2. Truck'
    print 'Enter the number of the option > '
    gets.chomp.to_i
  end

  def get_input(prompt)
    input = ''
    while input.empty?
      print prompt
      input = gets.chomp
    end
    input
  end

  def print_main_menu
    puts 'Choose the option you want to do'
    puts '1. List vehicles'
    puts '2. Add a vehicle'
    puts '3. Remove a vehicle'
    puts '4. Generate quote'
    puts '5. Exit'
  end

  def list_extras
    puts 'Extras:'
    i = 0
    Extra::PRICES_EXTRAS.each do |extra, price|
      i += 1
      puts "#{i}. #{extra}: $#{price}"
    end
  end
end
