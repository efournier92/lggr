require './Cal_Tools'
require './Do'
require './Lg'

type = ''
month = 1
days_in_month = Cal_Tools.days_in_months

until type == 'DO' || type == 'LG'
  print "DO || LG?\n>> "
  type = gets.chomp
end

print "Which Year?\n>> "
year = gets.chomp.to_i

if Cal_Tools.is_leap_year?(year)
  days_in_month[1] = 29
end

if type == 'DO'
  Do.print(days_in_month, year, month)
elsif type == 'LG'
  Lg.print(days_in_month, year, month)
end
