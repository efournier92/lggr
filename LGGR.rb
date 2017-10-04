require './models/Day'
require './models/Month'
require './models/Week'
require './models/Year'
require './modules/Birthdays'
require './modules/Add_Tag'
require './modules/Holidays'
require './modules/Printer'
require 'pry'

print_type = ''
month = 1
do_year = Year.new(1993)

do_year = Month.add_start_tasks(do_year)
do_year = Year.add_holidays(do_year)
do_year = Year.add_birthdays(do_year)
Printer.print_do(do_year)
Printer.print_lg(do_year)
binding.pry

# days_in_months = Templates.days_in_months

# until type == 'DO' || type == 'LG'
#   print "DO || LG?\n>> "
#   type = gets.chomp
# end

# print "Which Year?\n>> "
# year = gets.chomp.to_i

# if Cal_Tools.is_leap_year?(year)
#   days_in_months[1] = 29
# end

# if type == 'DO'
#   Do.print(days_in_months, year, month)
# elsif type == 'LG'
#   Lg.print(days_in_months, year, month)
# end

