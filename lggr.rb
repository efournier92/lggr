require './Cal_Tools'
require './Do'
require './Lg'

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

month = 1

days_in_month = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
if Cal_Tools.is_leap_year?(year)
  days_in_month[1] = 29
end

if type == 'DO'
  print_do_file(days_in_month, year, month)
elsif type == 'LG'
  print_lg_file(days_in_month, year, month)
end
