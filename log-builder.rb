require 'pry'

def get_first_monday(year)
  years_since = year - 1
  leap_years = years_since / 4
  century_years = years_since / 100
  four_century_years = years_since / 400

  total_leap_years = leap_years - century_years + four_century_years
  total_precesion = years_since + total_leap_years
  day_index = total_precesion % 7

  first_monday = 7 - day_index + 1;
end

def get_first_friday(year)
  first_sunday = get_first_sunday(year) - 1
  if first_sunday >= 2
    first_friday = first_sunday - 2
  else
    first_friday = first_sunday + 5
  end
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
  day = get_first_monday(year)
  week_index = 0

  do_week_template = {
    'Mon' => ['Gt', 'Ln'],
    'Tue' => ['Gt', 'Ln'],
    'Wed' => ['Gt', 'Ln'],
    'Thu' => ['Gt', 'GS()', 'Ln'],
    'Fri' => ['Gt', 'Lg', 'aLg', 'LgWk', 'Bgt', 'PyCC'],
    'Sat' => ['Gt'],
    'Sun' => ['Gt', 'Amz()', 'ClHm()', 'ClnKtch', 'ClnFrdg', 'Vac()', 'Sv', 'Ns', 'AF(00)', 'TM', 'Ln', 'Ap']
  }

  sun_evn = ['Gt', 'Amz()', 'ClHm()', 'ClnKtch', 'ClnFrdg', 'Vac()', 'Sv', 'Ns', 'AF(00)', 'TM', 'Ln', 'Ap']
  sun_odd = ['Gt', 'Amz()', 'ClHm()', 'DoLn()', 'FldLn', 'ClnKtch', 'ClnFrdg', 'Sv', 'Ns', 'AF(00)', 'TM', 'Ln', 'Ap']
  52.times do
    do_week = do_week_template 

    if week_index.odd?
      do_week['Sun'] = sun_odd
    end

    out_file.puts('************************')
    out_file.puts("#{ year }-#{ '%02d' % month }-#{ '%02d' % day }")
    out_file.puts('************************')

    do_week.each do |day, tasks|
      out_file.print(
        day + ' - '
      )
      tasks.each do |task|
        out_file.print (
          task + ', '
        )
      end
      out_file.print("\n")
    end

    day += 7

    if day > days_in_month[month - 1]
      day = day - days_in_month[month - 1]
      month += 1
    end

    week_index += 1
  end
  out_file.puts("************************\n\n")
  out_file.close
end

def print_lg_file(days_in_month, year, month)
  day = get_first_friday(year)
  day_index = 0
  friday_index = 1
  days = ['Fri - ', 'Sat - ', 'Sun - ', 'Mon - ', 'Tue - ', 'Wed - ', 'Thr - ']
  # Find total days in year
  days_in_year = days_in_month.inject(:+)

  out_file = File.new("#{ year }_LG.txt", "w")

  weekday_string    = "***\n[S]\n***\n[R]\n"
  weekend_string    = "***\n[R]\n"
  odd_friday_string = "***\n[S]\n***\n[S]\n***\n[R]\n"

  year_arr = []

  until month == 13 do
    day_string  = ""
    day_string += "************************\n"
    day_string += "#{ year }-#{ '%02d' % month }-#{ '%02d' % day }\n"
    day_string += "*********\n#{ days[day_index] }\n"

    if day_index == 1 || day_index == 2
      day_string += weekend_string
      friday_index += 1
    elsif days[day_index] == 'Fri - ' && friday_index > 8
      day_string += odd_friday_string 
      friday_index = 1
    else
      day_string += weekday_string 
      friday_index += 1
    end

    if day >= days_in_month[month - 1]
      day = 0
      month += 1
    end

    if day_index == 6
      day_index = 0
    else
      day_index += 1
    end

    day += 1
    year_arr.push(day_string)
  end

  year_arr.reverse_each do | day |
    out_file.print(day)
  end
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

days_in_month = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
if is_leap_year?(year)
  days_in_month[1] = 29
end

if type == 'DO'
  print_do_file(days_in_month, year, month)
elsif type == 'LG'
  print_lg_file(days_in_month, year, month)
end

