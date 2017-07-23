require './Cal_Tools'
require './Do'
require './Lg'

days_in_month = Cal_Tools.days_in_months
month = 1
type = ''

until type == 'DO' || type == 'LG'
  if type == 'DO'
    Do.print(days_in_month, year, month)
  elsif type == 'LG'
    Lg.print(days_in_month, year, month)
  else
    print "DO || LG?\n>> "
    type = gets.chomp
  end
end

print "Which Year?\n>> "
year = gets.chomp.to_i

if Cal_Tools.is_leap_year?(year)
  days_in_month[1] = 29
end

