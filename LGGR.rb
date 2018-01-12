require 'pry'
require './models/Day'
require './models/Month'
require './models/Week'
require './models/Year'
require './modules/Add_Tag'
require './modules/Birthdays'
require './modules/Bookend_Weeks'
require './modules/Holidays'
require './modules/Printer'
print_type = ''
month = 1

until print_type == 'DO' || print_type == 'LG'
  print "DO || LG\n>> "
  print_type = gets.chomp
end

if print_type == 'DO'
  print "All || Month #\n>> "
  do_print_month = gets.chomp
  require 'pry'
  binding.pry

  until do_print_month == 'All' 
    print "Which Month [0-11]\n>> "
    print_type = gets.chomp.to_i

  end
end

print "Which Year?\n>> "
year = gets.chomp.to_i

# create year object
do_year = Year.new(year)
# add monthly tasks to year object
do_year = Month.add_start_tasks(do_year)
# add birthdays to year object
do_year = Year.add_birthdays(do_year)
# add holidays to year object
do_year = Year.add_holidays(do_year)

if print_type == 'DO'
  do_year = Bookend_Weeks.shift_do_start(do_year)
  do_year = Bookend_Weeks.shift_do_end(do_year)
  Printer.print_do(do_year)
elsif print_type == 'LG'
  do_year = Bookend_Weeks.shift_lg_start(do_year)
  do_year = Bookend_Weeks.shift_lg_end(do_year)
  Printer.print_lg(do_year)
end

