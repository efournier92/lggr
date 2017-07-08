require 'pry'
out_file = File.new("logYear.txt", "w")

print "What Year?\n>> "
year = gets.chomp.to_i

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

total_precesion = 0
day = get_first_sunday(year)
month = 1

days_in_month = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]

if (year % 4 == 0 && !(year % 100 == 0 && year % 400 != 0))
    days_in_month[1] = 29
end

  52.times do

    date = "#{ year }-#{ '%02d' % month }-#{ '%02d' % day }"
    out_file.print(
    %{\
*******************
#{ date }
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
    total_precesion += 7
    if day > days_in_month[month - 1]
      day = day - days_in_month[month - 1]
      month += 1
    end

  end

  out_file.close

