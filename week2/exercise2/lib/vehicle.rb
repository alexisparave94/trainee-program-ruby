class Vehicle
  attr_accessor :wheels_number, :color, :brand, :price

  def initialize(wheels_number, color, brand, price)
    @wheels_number = wheels_number
    @color = color
    @brand = brand
    @price = price
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