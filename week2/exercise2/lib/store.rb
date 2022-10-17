# Import library securerandom to generate random ids
require 'securerandom'
# Import library to show vehicle in a table
require "terminal-table"

# Class Extra to represent a store of vehicles
class Store
  # Attributes
  attr_accessor :vehicles

  def initialize
    @vehicles = []
  end

  # Method to list all the vehicle that has the store
  def list_vehicles
    table = Terminal::Table.new
    table.title = "Vehicles"
    table.headings = ["ID", "Brand", "Color", "Price", "Type"]
    table.rows = vehicles.map do |store_vehicle|
      obj_vehicle = store_vehicle['obj_vehicle']
      [store_vehicle['id'], obj_vehicle.brand, obj_vehicle.color, obj_vehicle.price, store_vehicle['type']]
    end
    table
  end

  # Method to add a new vehicle to the store
  def add_vehicle(vehicle)
    # Generate a random id for the new vehicle
    id = SecureRandom.uuid
    # Set the type of the vehicle
    type = vehicle.wheels_number == 4 ? 'car' : 'truck'
    # Sve the vehicle object with the randim id and its tipe
    store_vehicle = { 'id' => id, 'obj_vehicle' => vehicle, 'type' => type }
    vehicles.push(store_vehicle)
  end

  # Method to remove a vehicle from the store
  def remove_vehicle(id)
    vehicles.reject! { |store_vehicle| store_vehicle['id'] == id }
  end

  # Method to show features, extras and the total price as a quote
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

  # Method to calculate the total for a quote
  def calculate_total(vehicle_price, extra_features)
    vehicle_price + extra_features.extras_with_prices.reduce(0) { |memo, (_key, val)| memo + val }
  end
end
