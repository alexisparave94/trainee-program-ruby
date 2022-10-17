# Class Vehicle to represent vehicles of a store
class Vehicle
  # Constants
  CARS_BRANDS = %w[Toyota Kia Hyundai Wolkswagen Suzuki Nissan Mazda].freeze
  TRUCK_BRANDS = %w[Scania Volvo Foton Izusu].freeze
  VEHICLE_COLORS = %w[red blue green black white gray].freeze
  TYPES = %w[car truck].freeze

  # Attributes
  attr_accessor :wheels_number, :color, :brand, :price

  def initialize(wheels_number, color, brand, price)
    @wheels_number = wheels_number
    @color = color
    @brand = brand
    @price = price
  end

  # Method to create an array with 5 randoms vehicles
  def self.create_5_vehicles
    random_vehicles = []
    5.times do
      # Select a random type from TYPES
      type = TYPES.sample
      # Select a random color from COLORS
      color = VEHICLE_COLORS.sample
      if type == 'car'
        # Select a random cAr from CARS BRANDS
        brand = CARS_BRANDS.sample
        # Generate a random price, the prices are between 100 000 and 10 000
        price = (((rand * 90).round + 10) * 1000).to_f
        # Add the random car to random_vehicles
        random_vehicles.push(Car.new(color, brand, price))
      else
        # Generate a random wheels number, the vules are between 16 and 6
        wheels_number = (rand * 10).round + 6
        # Select a random cAr from TRUCK BRANDS
        brand = TRUCK_BRANDS.sample
        # Generate a random price, the prices are between 600 000 and 100 000
        price = (((rand * 500).round + 100) * 1000).to_f
        # Add the random truck to random_vehicles
        random_vehicles.push(Truck.new(wheels_number, color, brand, price))
      end
    end
    random_vehicles
  end
end

# Car class inherits from vehicle class
class Car < Vehicle
  def initialize(color, brand, price)
    # It has 4 wheels by default
    super(4, color, brand, price)
  end
end

# Truck class inherits from vehicle class
class Truck < Vehicle
  def initialize(wheels_number, color, brand, price)
    valid_wheels_number(wheels_number)
    super(wheels_number, color, brand, price)
  end

  # Method to validate a number of wheels greater than 4
  def valid_wheels_number(wheels_number)
    raise ArgumentError, 'Wheels number should be grater than 4' if wheels_number <= 4
  end
end
