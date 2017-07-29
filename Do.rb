require 'pry'

module Do
  def self.print(days_in_month, year, month)
    out_file = File.new("#{ year }_DO.txt", "w")
    day = Cal_Tools.get_first_monday(year)
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

    next_week = nil


    52.times do
      if next_week
        do_week = next_week
      else
        do_week = Templates.do_week
      end

      next_week = nil

      if week_index.odd?
        do_week['Sun'] = Templates.do_week_odd_sunday
      end

      days_this_week = Cal_Tools.days_this_week(day)

      do_week = Cal_Tools.is_week_odd?(do_week, week_index)
      # binding.pry
      do_week = Cal_Tools.month_end(do_week, days_this_week)

      month_start = Cal_Tools.month_start(do_week, days_this_week)
      do_week = month_start['do_week']
      next_week = month_start['next_week']

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

