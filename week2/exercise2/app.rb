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
      when 1 then puts 'list vehicle'
      when 2 then puts 'add_vehicle'
      when 3 then puts 'remove vehicle'
      when 4 then puts 'generate quote'
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
end

app = App.new
app.start