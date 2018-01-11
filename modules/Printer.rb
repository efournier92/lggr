module Printer

  def self.print_do(do_year)
    year = do_year.year 
    out_file = File.new("./Out/DO_#{ '%04d' % year }.md", "w")
    do_year.weeks.each do | week |
      week.days.each do | day |
      if day.name == 'Monday'
        out_file.puts("## #{ '%04d' % day.year }-#{ '%02d' % day.month }-#{ '%02d' % day.month_day }")
      end
      out_file.puts("### #{ day.name }")
      day.tasks.each do |task|
        out_file.print("#{ task }, ")
      end
      out_file.puts
    end
    out_file.puts
    end
  end

  def self.print_lg(do_year)
    year = do_year.year
    out_file = File.new("./Out/LG_#{ '%04d' % year }.md", "w")

    weekday_string = "### Do\n\n### Scrm\n\n### \n\n\n"
    weekend_string = "### Do\n\n###\n\n\n"
    friday_string  = "### Do\n\n### Nxt_Scrm\n\n### Scrm\n\n### \n\n\n"

    do_year.weeks.reverse_each do | week |
      week.days.reverse_each do | day |
        out_file.puts("## #{ '%04d' % day.year }-#{ '%02d' % day.month }-#{ '%02d' % day.month_day } | #{day.name}")
        if day.name == 'Friday'
          out_file.puts(friday_string)
        elsif day.name == 'Saturday' || day.name == 'Sunday'
          out_file.puts(weekend_string)
        else
          out_file.puts(weekday_string)
        end
      end
    end
  end

end

