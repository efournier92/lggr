module LG
  def self.print(days_in_month, year, month)
    day = Cal_Tools.get_first_friday(year)
    day_index = 0
    second_friday_index = 1
    days = ['Fri - ', 'Sat - ', 'Sun - ', 'Mon - ', 'Tue - ', 'Wed - ', 'Thr - ']
    days_in_year = days_in_month.inject(:+)

    out_file = File.new("#{ year }_LG.txt", "w")
    weekday_string    = "***\n[S]\n***\n[R]\n"
    weekend_string    = "***\n[R]"
    odd_friday_string = "***\n[S]\n***\n[S]\n***\n[R]"

    until month == 13 do
      out_file.puts("************************")
      out_file.puts("#{ year }-#{ '%02d' % month }-#{ '%02d' % day }")
      out_file.puts("*********\n\n")

      if day_index == 1 || day_index == 2
        out_file.puts(weekend_string)
        second_friday_index += 1
      elsif second_friday_index > 14
        out_file.puts(odd_friday_string)
        second_friday_index = 1
      else
        out_file.print(weekday_string)
        second_friday_index += 1
      end

      if day > days_in_month[month - 1]
        day = 1
        month += 1
      end

      if day_index == 6
        day_index = 0
      else
        day_index += 1
      end

      day += 1
    end
    out_file.puts("************************\n\n")
    out_file.close
  end
end

