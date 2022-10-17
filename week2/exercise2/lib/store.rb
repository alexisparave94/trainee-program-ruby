class Store
  attr_accessor :vehicles

  def initialize
    @vehicles = []
  end

  def list_vehicles
    vehicles.each.with_index do |store_vehicle, index|
      print "#{index + 1}. ID: #{store_vehicle['id']}, "
      print "#{store_vehicle['obj_vehicle'].brand} #{store_vehicle['obj_vehicle'].color}, "
      print "price: $#{store_vehicle['obj_vehicle'].price}, "
      print "type: #{store_vehicle['type']}\n"
    end
  end

  def add_vehicle(vehicle)
    id = SecureRandom.uuid
    type = vehicle.wheels_number == 4 ? 'car' : 'truck'
    store_vehicle = { 'id' => id, 'obj_vehicle' => vehicle, 'type' => type }
    vehicles.push(store_vehicle)
  end

  def remove_vehicle(id)
    vehicles.reject! { |store_vehicle| store_vehicle['id'] == id }
  end

  def show_features(vehicle, extras)
    extra_features = Extra.new(vehicle, extras)
    puts "\tFeatures\n\n"
    puts "\tColor: #{vehicle.color}\n\n"
    puts "\tBrand: #{vehicle.brand}\n\n"
    puts "\tPrice: $#{vehicle.price}\n\n"
    puts '-------------------------------------------------'
    puts "Extras:\n"
    extra_features.list_vehicle_extras
    total = calculate_total(vehicle.price, extra_features)
    puts '-------------------------------------------------'
    puts "\tTotal: $#{total}\n"
  end

  private

  def calculate_total(vehicle_price, extra_features)
    vehicle_price + extra_features.extras_with_prices.reduce(0) { |memo, (_key, val)| memo + val }
  end
end
