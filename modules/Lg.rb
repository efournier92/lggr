module Lg
  def self.print(days_in_month, year, month)
    day = Cal_Tools.get_first_friday(year)
    day_index = 0
    friday_index = 1
    days = Templates.lg_day_names
    # Find total days in year
    days_in_year = days_in_month.inject(:+)

    out_file = File.new("./Out/#{ year }_LG.txt", "w")

    weekday_string    = "***\n[S]\n***\n[R]\n"
    weekend_string    = "***\n[R]\n"
    friday_string = "***\n[S]\n***\n[S]\n***\n[R]\n"

    year_arr = []

    until month == 13 do
      day_string  = ""
      day_string += "************************\n"
      day_string += "#{ year }-#{ '%02d' % month }-#{ '%02d' % day }\n"
      day_string += "*********\n#{ days[day_index] } - \n"

      if day_index == 1 || day_index == 2
        day_string += weekend_string
      elsif days[day_index] == 'Fri'
        day_string += friday_string 
      else
        day_string += weekday_string 
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

