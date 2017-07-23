module Lg
  def self.print(days_in_month, year, month)
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
end

