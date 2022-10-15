class Vehicle
  CARS_BRANDS = %w[Toyota Kia Hyundai Wolkswagen Suzuki Nissan Mazda].freeze
  TRUCK_BRANDS = %w[Scania Volvo Foton Izusu].freeze
  VEHICLE_COLORS = %w[red blue green black white gray].freeze
  TYPES = %w[car truck].freeze

  attr_accessor :wheels_number, :color, :brand, :price

  def initialize(wheels_number, color, brand, price)
    @wheels_number = wheels_number
    @color = color
    @brand = brand
    @price = price
  end

  def self.create_5_vehicles
    random_vehicles = []
    5.times do
      type = TYPES.sample
      color = VEHICLE_COLORS.sample
      if type == 'car'
        brand = CARS_BRANDS.sample
        price = (((rand * 90).round + 10) * 1000).to_f
        random_vehicles.push(Car.new(color, brand, price))
      else
        wheels_number = (rand * 10).round + 6
        brand = TRUCK_BRANDS.sample
        price = (((rand * 500).round + 100) * 1000).to_f
        random_vehicles.push(Truck.new(wheels_number, color, brand, price))
      end
    end
    random_vehicles
  end
end

class Car < Vehicle
  def initialize(color, brand, price)
    super(4, color, brand, price)
  end
end

class Truck < Vehicle
  def initialize(wheels_number, color, brand, price)
    valid_wheels_number(wheels_number)
    super(wheels_number, color, brand, price)
  end

  def valid_wheels_number(wheels_number)
    raise ArgumentError, 'Wheels number should be grater than 4' if wheels_number <= 4
  end
end
