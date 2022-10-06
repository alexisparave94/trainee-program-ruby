require 'date'
require 'csv'

def valid_negative_values?(str_date)
  date, time = str_date.split('')
  arr_date = date.split('/') + time.split(':')
  arr_date.all? { |item| item.to_i >= 0 }
end

csv_valid_dates = []
csv_invalid_dates = []

csv_read = CSV.read('events.csv')
csv_read.each.with_index do |date, index|
  date_time = "#{date[1]} EST"
  line = index + 1
  begin
    raise Date::Error, 'invalid date' unless valid_negative_values?(date[1])

    valid_date = DateTime.parse(date_time).to_s
    csv_valid_dates << [valid_date]
  rescue Date::Error => error
    csv_invalid_dates << [date[1], line]
    puts "Error: #{error} at line #{line}"
  end
end

CSV.open('valid_dates.csv', 'w') do |csv|
  csv_valid_dates.sort.each do |date|
    csv << date
  end
end

CSV.open('invalid_dates.csv', 'w') do |csv|
  csv_invalid_dates.each do |date|
    csv << date
  end
end

total_dates = csv_read.size
total_valid_dates = csv_valid_dates.size
total_invalid_dates = csv_invalid_dates.size

def generate_bar(size, cant = 1, symbol = '*')
  "#{(symbol * cant) * size}|"
end

def calc_rel_value(value, total, num_dec = 0)
  (value * 1.0 / total) * 100.round(num_dec)
end

rel_int_val_valid_dates = calc_rel_value(total_valid_dates, total_dates)
rel_dec_val_valid_dates = calc_rel_value(total_valid_dates, total_dates, 2)
rel_int_val_invalid_dates = calc_rel_value(total_invalid_dates, total_dates)
rel_dec_val_invalid_dates = calc_rel_value(total_invalid_dates, total_dates, 2)

CSV.open('valid_dates.csv', 'a') do |csv|
  csv << []
  csv << []
  csv << ['Graphics']
  csv << []
  csv << ['Absolute Frecuency graph']
  csv << []
  csv << ["Total dates  : #{generate_bar(total_dates, 2)} #{total_dates}"]
  csv << ["Valid dates  : #{generate_bar(total_valid_dates, 2)} #{total_valid_dates}"]
  csv << ["Invalid dates: #{generate_bar(total_invalid_dates, 2)} #{total_invalid_dates}"]
  csv << []
  csv << ['Relative Frecuency graph']
  csv << []
  csv << ["Total dates  : #{generate_bar(100)} 100%"]
  csv << ["Valid dates  : #{generate_bar(rel_int_val_valid_dates)} #{rel_dec_val_valid_dates}%"]
  csv << ["Invalid dates: #{generate_bar(rel_int_val_invalid_dates)} #{rel_dec_val_invalid_dates}%"]
end
