module Printer

  def self.print_do(do_year)
    year = do_year.year 
    out_file = File.new("./Out/#{ '%04d' % year }_DO.txt", "w")
    do_year.weeks.each do | week |
      week.days.each do | day |
        if day.name == 'Mon'
          out_file.puts('************************')
          out_file.puts("#{ '%04d' % day.year }-#{ '%02d' % day.month }-#{ '%02d' % day.month_day }")
          out_file.puts('************************')
        end
        out_file.print("#{ day.name } - ")
        day.tasks.each do |task|
          out_file.print("#{ task }, ")
        end
        out_file.puts('')
      end
    end
    out_file.puts('************************')
  end

  def self.print_lg(do_year)
    year = do_year.year
    out_file = File.new("./Out/#{ '%04d' % year }_LG.txt", "w")

    weekday_string = "***\n[S] \n***\n[R] \n"
    weekend_string = "***\n[R] \n"
    friday_string  = "***\n[S] \n***\n[S] \n***\n[R] \n"

    do_year.weeks.each do | week |
      week.days.each do | day |
          out_file.puts('************************')
          out_file.puts("#{ '%04d' % year }-#{ '%02d' % day.month }-#{ '%02d' % day.month_day }")
          out_file.puts('***********')
          out_file.puts("#{ day.name } - ")
          if day.name == 'Fri'
            out_file.puts(friday_string)
          elsif day.name == 'Sat' || day.name == 'Sun'
            out_file.puts(weekend_string)
          else
            out_file.puts(weekday_string)
          end
      end
    end
  end

end

