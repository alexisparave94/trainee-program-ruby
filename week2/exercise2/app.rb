require_relative 'lib/store'
require_relative 'lib/vehicle'
require_relative 'lib/extra'

class App
  attr_accessor :store

  def start
    populate_store
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