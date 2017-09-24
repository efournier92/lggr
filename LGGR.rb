require 'pry'
require './Models/year.rb'
require './Models/week.rb'
require './Models/day.rb'
require './modules/Cal_Tools'
require './modules/Holidays'
require './modules/Templates'
require './modules/Do'
require './modules/Lg'

type = ''
month = 1
do_year = Year.new(1999)

# do_year = Year.month_start(do_year)
do_year.add_holidays
do_year.add_birthdays

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

