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
end
