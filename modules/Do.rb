module Do
  def self.print(days_in_month, year, month)
    out_file = File.new("./Out/#{ year }_DO.txt", "w")
    day = Cal_Tools.get_first_monday(year)

    week_index = 0

    52.times do
      do_week = Templates.do_week
      do_week.week_index = week_index

      if week_index.odd?
        do_week['Sun'] = Templates.do_week_odd_sunday
      end

      do_week.days = Cal_Tools.days_this_week(day, month)

      do_week = Cal_Tools.is_week_odd?(do_week, week_index)
      do_week = Cal_Tools.month_end(do_week, do_week.days)
      do_week = Cal_Tools.month_start(do_week, week_index, do_week.days, month)

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
      first_day_of_month = nil
      week_index += 1
    end

    out_file.puts("************************\n\n")
    out_file.close
  end
end

