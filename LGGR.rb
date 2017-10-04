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
binding.pry

days_in_months = do_year.days_in_months

until type == 'DO' || type == 'LG'
  print "DO || LG?\n>> "
  type = gets.chomp
end

print "Which Year?\n>> "
year = gets.chomp.to_i

# create year object
do_year = Year.new(year)
# add monthly tasks to year object
do_year = Month.add_start_tasks(do_year)
# add holidays to year object
do_year = Year.add_holidays(do_year)
# add birthdays to year object
do_year = Year.add_birthdays(do_year)

if Cal_Tools.is_leap_year?(year)
  days_in_months[1] = 29
end

if type == 'DO'
  Printer.print_do(do_year)
elsif type == 'LG'
  Printer.print_lg(do_year)
end

