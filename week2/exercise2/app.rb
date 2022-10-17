require_relative 'lib/store'
require_relative 'lib/vehicle'
require_relative 'lib/extra'

class App
  attr_accessor :store

  def start
    populate_store
    puts 'Welcome to Store App'
    option = ''
    until option == 5
      puts 'Choose the option you want to do'
      puts '1. List vehicles'
      puts '2. Add a vehicle'
      puts '3. Remove a vehicle'
      puts '4. Generate quote'
      puts '5. Exit'
      print 'Enter the number of the option > '
      option = gets.chomp.to_i
      case option
      when 1 then puts list_vehicles
      when 2 then puts add_vehicle
      when 3 then puts remove_vehicle
      when 4 then puts generate_quote
      end
    end
    puts 'Thanks for use app'
  end

  private

  def populate_store
    @store = Store.new
    Vehicle.create_5_vehicles.each do |vehicle|
      store.add_vehicle(vehicle)
    end
  end

  def list_vehicles
    puts "\nVehicles of the store: "
    store.list_vehicles
    puts ''
  end

  def add_vehicle
    puts "\nWhat kind of vehicle you want to add?"
    puts '1. Car | 2. Truck'
    print 'Enter the number of the option > '
    type = gets.chomp.to_i
    type = Vehicle.get_types[type - 1]
    puts "You are going to add a #{type}"
    puts 'Enter features: '
    print 'Brand: '
    brand = gets.chomp
    print 'Color: '
    color = gets.chomp
    print 'Price: '
    price = gets.chomp.to_f
    begin
      if type == 'car'
        vehicle = Car.new(color, brand, price)
      else
        print 'Wheels number: '
        wheels_number = gets.chomp.to_i
        vehicle = Truck.new(wheels_number, color, brand, price)
      end
    rescue ArgumentError => err
      puts err
      retry
    end
    store.add_vehicle(vehicle)
    puts "\nVehicle add to store\n"
  end

  def remove_vehicle
    print "Enter the vehicle's ID > "
    id = gets.chomp
    store.remove_vehicle(id)
    print "\nVehicle remove from store\n"
  end

  def generate_quote
    puts "If you know the vehicle's ID you want quote press Enter"
    print 'Or write back and list vehicles to get the ID > '
    back = gets.chomp
    return if back == 'back'

    print "Enter the vehicle's ID > "
    id = gets.chomp
    selected_store_vehicle = store.vehicles.select { |store_vehicle| store_vehicle['id'] == id }[0]
    obj_vehicle = selected_store_vehicle['obj_vehicle']
    print 'Do you want to add extras?(y/n) > '
    add_extras = gets.chomp
    extras = []
    if add_extras == 'y'
      puts 'Extras:'
      i = 0
      Extra.get_prices_extras.each do |extra, price|
        i += 1
        puts "#{i}. #{extra}: $#{price}"
      end
      print 'Enter numbers of the extras > '
      arr_num = gets.chomp.split(' ').map(&:to_i)
      extras = arr_num.map { |num| Extra.get_extras[num - 1] }
    end
    puts "Details:\n\n"
    puts "\tQuote for car: #{selected_store_vehicle['id']}\n\n"
    store.show_features(obj_vehicle, extras)
  end
end

app = App.new
app.start
