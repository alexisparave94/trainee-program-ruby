# Import libraries
require 'date'
require 'csv'

# Generarte a validation for negative values in a datetime
def valid_negative_values?(str_date)
  date, time = str_date.split('')
  arr_date = date.split('/') + time.split(':')
  arr_date.all? { |item| item.to_i >= 0 }
end

# Array to save valid and invalid dates
csv_valid_dates = []
csv_invalid_dates = []

# Read and save the content of events.csv file
csv_read = CSV.read('events.csv')
# This block separate the valid and invalid dates
csv_read.each.with_index do |date, index|
  # Add the EST timezone
  date_time = "#{date[1]} EST"
  line = index + 1
  begin
    # Raise an Date::Error in case of negative values
    raise Date::Error, 'invalid date' unless valid_negative_values?(date[1])

    valid_date = DateTime.parse(date_time).to_s
    # If no exeption is detected the date parsed is save in csv_valid_dates
    csv_valid_dates << [valid_date]
  
  # If any exeption of type Date::error occurs, rescue the error
  rescue Date::Error => error
    # Save the invalid date and the line number where is found in csv_invalid_dates
    csv_invalid_dates << [date[1], line]
    # Print in console the line number where is found the invalid date
    puts "Error: #{error} at line #{line}"
  end
end

# Write valid dates in valid_dates.csv file
CSV.open('valid_dates.csv', 'w') do |csv|
  csv_valid_dates.sort.each do |date|
    csv << date
  end
end

# Write invalid dates and their line number where are found in invalid_dates.csv file
CSV.open('invalid_dates.csv', 'w') do |csv|
  csv_invalid_dates.each do |date|
    csv << date
  end
end

# Number of dates
total_dates = csv_read.size
# Number of valid dates
total_valid_dates = csv_valid_dates.size
# Number of invalid dates
total_invalid_dates = csv_invalid_dates.size

# Method to generate an specific bar of a graphic
def generate_bar(size, cant = 1, symbol = '*')
  "#{(symbol * cant) * size}|"
end

# Method to calculte the relative value of a quantity
def calc_rel_value(value, total, num_dec = 0)
  (value * 1.0 / total) * 100.round(num_dec)
end

# Relative values of valid dates
# Integer value
rel_int_val_valid_dates = calc_rel_value(total_valid_dates, total_dates)
# Decimal value
rel_dec_val_valid_dates = calc_rel_value(total_valid_dates, total_dates, 2)
# Relative values of invalid dates
# Integer value
rel_int_val_invalid_dates = calc_rel_value(total_invalid_dates, total_dates)
# Decimal value
rel_dec_val_invalid_dates = calc_rel_value(total_invalid_dates, total_dates, 2)

# This block generate two graphics in the csv file
CSV.open('valid_dates.csv', 'a') do |csv|
  csv << []
  csv << []
  csv << ['Graphics']
  csv << []
  csv << ['Absolute Frecuency graph']
  csv << []
  # Generate an absolute frecuency value
  csv << ["Total dates  : #{generate_bar(total_dates, 2)} #{total_dates}"]
  csv << ["Valid dates  : #{generate_bar(total_valid_dates, 2)} #{total_valid_dates}"]
  csv << ["Invalid dates: #{generate_bar(total_invalid_dates, 2)} #{total_invalid_dates}"]
  csv << []
  csv << ['Relative Frecuency graph']
  csv << []
  # Generate a relative frecuency value
  csv << ["Total dates  : #{generate_bar(100)} 100%"]
  csv << ["Valid dates  : #{generate_bar(rel_int_val_valid_dates)} #{rel_dec_val_valid_dates}%"]
  csv << ["Invalid dates: #{generate_bar(rel_int_val_invalid_dates)} #{rel_dec_val_invalid_dates}%"]
end
