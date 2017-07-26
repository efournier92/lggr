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


    sun_odd = ['Gt', 'Amz()', 'ClHm()', 'DoLn()', 'FldLn', 'ClnKtch', 'ClnFrdg', 'Sv', 'Ns', 'AF(00)', 'TM', 'Ln', 'Ap']

    52.times do
      do_week = do_week_template 
      days_this_week = Cal_Tools.days_this_week(day)
      first_day_of_month = days_this_week.index(1)

      if first_day_of_month
        first_index = days_this_week[first_day_of_month]
        day_of_first = Cal_Tools.day_names[first_index]
        binding.pry
        do_week[day_of_first].unshift('PyRnt')
      end

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
  end

