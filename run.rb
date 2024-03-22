require './src/modules/log_sketcher'

arguments = ARGV

config_file = arguments[0].is_a?(String) && File.exist?(arguments[0]) ? arguments[0] : ''
print_type = arguments[1] == 'LG' || arguments[1] == 'DO' ? arguments[1] : ''
print_year = arguments[2].to_i.is_a?(Integer) ? arguments[2].to_i : nil
print_month = arguments[3].to_i.is_a?(Integer) ? arguments[3].to_i : nil

sketcher = LogSketcher.new(config_file, print_type, print_year, print_month)
sketcher.main
