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