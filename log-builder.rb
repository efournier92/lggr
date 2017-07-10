def get_first_sunday(year)
  years_since = year - 1
  leap_years = years_since / 4
  century_years = years_since / 100
  four_century_years = years_since / 400

  total_leap_years = leap_years - century_years + four_century_years
  total_precesion = years_since + total_leap_years
  day_index = total_precesion % 7

  first_sunday = 7 - day_index;
end

def print_log_to_file(days_in_month, year, month, day)
  out_file = File.new("#{ year }_Log.txt", "w")
  52.times do
    out_file.print(
%{\
*******************
#{ year }-#{ '%02d' % month }-#{ '%02d' % day }
*******************
Mon - Gt, Ln, 
Tues - Gt, Ln, 
Wed - Gt, Ln, 
Thu - Gt, GS(), Ln, 
Fri - Gt, LgWks, aLg, Lg, Bgt, PyCC, 
Sat - Gt, 
Sun - Gt, Amz(), ClHm(), ClnKtch, ClnFrdg, Vac(), Sv, Ns, AF(00), TM, Ln, Ap,
}
    )
    day += 7

    if day > days_in_month[month - 1]
      day = day - days_in_month[month - 1]
      month += 1
    end
  end
  out_file.close
end

print "What Year?\n>> "
year = gets.chomp.to_i
day = get_first_sunday(year)
month = 1

days_in_month = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
if (year % 4 == 0 && !(year % 100 == 0 && year % 400 != 0))
  days_in_month[1] = 29
end

print_log_to_file(days_in_month, year, month, day)

