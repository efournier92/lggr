require 'pry'

def get_start_days(year)
  years_since = year - 1
  leap_years = years_since / 4
  century_years = years_since / 100
  four_century_years = years_since / 400

  total_leap_years = leap_years - century_years + four_century_years
  total_precesion = years_since + total_leap_years
  day_index = total_precesion % 7

  first_sunday = 7 - day_index;

  if first_sunday <= 2
    first_friday = first_sunday - 2
  else
    first_friday = first_sunday + 5
end

def is_leap_year?(year)
  if (year % 4 == 0 && !(year % 100 == 0 && year % 400 != 0))
    true 
  else
    false 
  end
end

def print_do_file(days_in_month, year, month)
  out_file = File.new("#{ year }_DO.txt", "w")
 
  day = first_sunday

  52.times do
    out_file.print(
%{\
************************
#{ year }-#{ '%02d' % month }-#{ '%02d' % day }
************************
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
  out_file.puts("************************\n\n")
  out_file.close
end

def print_lg_file(days_in_month, year, month)
  day = first_friday
  day_index = 0
  days = ['Fri - ', 'Sat - ', 'Sun - ', 'Mon - ', 'Tue - ', 'Wed - ', 'Thr - ']
  days_in_year = days_in_month.inject(:+)

  out_file = File.new("#{ year }_LG.txt", "w")

  until month == 13 do
    out_file.print(
%{\
*************************
#{ year }-#{ '%02d' % month }-#{ '%02d' % day }
**********
#{ days[day_index] }
***
[S] 
***
[R] 
}
    )
    day += 1
    # binding.pry

    if day > days_in_month[month - 1]
      day = 1
      month += 1
    end

    if day <= 6
      day_index++
    else
      day_index = 0
    end
  end
  out_file.puts("************************\n\n")
  out_file.close
end

type = ''

until type == 'DO' || type == 'LG'
  if type == 'DO'
    print_do_file(days_in_month, year, month)
  elsif type == 'LG'
    print_lg_file(days_in_month, year, month)
  else
    print "DO || LG?\n>> "
    type = gets.chomp
  end
end

print "Which Year?\n>> "
year = gets.chomp.to_i

month = 1
get_start_days(year)
days_in_month = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
if is_leap_year?(year)
  days_in_month[1] = 29
end

if type == 'DO'
  print_do_file(days_in_month, year, month)
elsif type == 'LG'
  print_lg_file(days_in_month, year, month)
end

