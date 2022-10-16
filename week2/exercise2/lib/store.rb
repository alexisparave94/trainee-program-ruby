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
end
