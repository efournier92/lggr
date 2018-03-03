require 'pry'
require './models/Day'
require './models/Month'
require './models/Week'
require './models/Year'
require './modules/Add_Tag'
require './modules/Birthdays'
require './modules/Bookend_Weeks'
require './modules/Annual'
require './modules/Printer'
print_type = ''
print_month = nil
month = 1

# Collect type user input
until print_type == 'DO' || print_type == 'LG'
  print "DO || LG\n>> "
  print_type = gets.chomp.upcase
end

# Collect year user input
year = nil
until year.is_a? Integer
  print "Which Year?\n>> "
  year = gets.chomp.to_i
end

# Collect month user input
if print_type == 'DO'
  is_valid = false
  until is_valid == true
    print "MONTH: All || [1-12]\n>> "
    print_month = gets.chomp.upcase
    is_valid = true if print_month == 'ALL' || print_month == 'A'
    if print_month.match(/^([1-9]|[01][0-1])$/)
      is_valid = true 
      print_month = print_month.to_i
    end
  end
end

# create year object
do_year = Year.new(year)
# add monthly tasks to year object
do_year = Month.add_start_tasks(do_year)
# add birthdays to year object
do_year = Year.add_birthdays(do_year)
# add annual tasks to year object
do_year = Year.add_annual_tasks(do_year)
# add laundry tasks with offset
if print_type == 'DO'
  ln_offset = nil
  until ln_offset.is_a? Integer
    print "Laundry Offset [0-2]\n>> "
    ln_offset = gets.chomp.to_i
  end
  do_year = Add_Tag.to_xday_every_n_weeks(
    do_year, 3, "Sunday", "Ln_drmt, Ln_Fld", ln_offset
  )
end

if print_type == 'DO'
  do_year = Bookend_Weeks.shift_do_start(do_year)
  do_year = Bookend_Weeks.shift_do_start(do_year)
  do_year = Bookend_Weeks.shift_do_end(do_year)

  if print_month.is_a? Integer
    Printer.print_do_month(do_year, print_month)
  else
    Printer.print_do_year(do_year)
  end
elsif print_type == 'LG'
  do_year = Bookend_Weeks.shift_lg_start(do_year)
  do_year = Bookend_Weeks.shift_lg_end(do_year)
  Printer.print_lg(do_year)
end

