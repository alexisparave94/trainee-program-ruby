require_relative 'lib/store'
require_relative 'lib/vehicle'
require_relative 'lib/extra'
require_relative 'lib/helpers/helper_app'

class App
  include HelperApp
  attr_accessor :store

  def start
    populate_store
    puts 'Welcome to Store App'
    option = ''
    until option == 5
      print_main_menu
      option = get_input('Enter the number of the option > ').to_i
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
    type_number = select_vehicle_type
    type = Vehicle.get_types[type_number - 1]
    puts "You are going to add a #{type}"
    puts 'Enter features: '
    brand = get_input('Brand: ')
    color = get_input('Color: ')
    price = get_input('Price: ').to_f
    begin
      if type == 'car'
        vehicle = Car.new(color, brand, price)
      else
        wheels_number = get_input('Wheels Number: ').to_i
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
    id = get_input("Enter the vehicle's ID you want to remove > ")
    store.remove_vehicle(id)
    print "\nVehicle remove from store\n"
  end

  def generate_quote
    puts "If you know the vehicle's ID you want to quote press Enter"
    print 'Or write back and list vehicles to get the ID > '
    back = gets.chomp
    return if back == 'back'

    id = get_input("Enter the vehicle's ID > ")
    selected_store_vehicle = store.vehicles.select { |store_vehicle| store_vehicle['id'] == id }[0]
    obj_vehicle = selected_store_vehicle['obj_vehicle']
    add_extras = get_input('Do you want to add extras?(y/n) > ')
    extras = []
    if add_extras == 'y'
      list_extras
      arr_num = get_input('Enter numbers of the extras > ').split(' ').map(&:to_i)
      extras = arr_num.map { |num| Extra.get_extras[num - 1] }
    end
    puts "Details:\n\n"
    puts "\tQuote for car: #{selected_store_vehicle['id']}\n\n"
    store.show_features(obj_vehicle, extras)
  end
end

app = App.new
app.start
