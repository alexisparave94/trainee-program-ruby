# Class Extra to represent additional features of a vehicle
class Extra
  # Constants
  PRICES_EXTRAS = { 'Radio' => 500.0, 'AC' => 1000.0, 'Sunroof' => 2000.0, 'Leather Seats' => 1000.0, 'Power Windows' => 1000.0 }.freeze
  EXTRAS = ['Radio', 'AC', 'Sunroof', 'Leather Seats', 'Power Windows'].freeze

  # Attributes
  attr_reader :extras_with_prices, :vehicle

  def initialize(vehicle, extras = [])
    @extras_with_prices = get_extras_with_prices(extras)
    @vehicle = vehicle
  end

  # Method to show the additional features(extras) that a vehicle has
  def list_vehicle_extras
    extras_with_prices.each do |extra, price|
      puts "\t#{extra}: ($#{price})\n\n"
    end
  end

  # Method to import extras to a vehicle
  def import_extras
    vehicle.extras = extras_with_prices
  end

  private

  # Method to set what extras a vehicle has
  def get_extras_with_prices(extras)
    extras_with_prices = {}
    extras.each { |extra| extras_with_prices[extra] = PRICES_EXTRAS[extra] }
    extras_with_prices
  end
end
