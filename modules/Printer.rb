require 'fileutils'

module Printer
  OUT_DIR = "./_out"

  def self.make_out_dir
    FileUtils.mkdir_p OUT_DIR
  end

  def self.print_tasks(out_file, day)
    make_out_dir
    out_file.puts("## #{ '%04d' % day.year }-#{ '%02d' % day.month }-#{ '%02d' % day.month_day } | #{day.name}")
    out_file.puts()
    out_file.puts("```text")

    day.tasks.each do |task|
      out_file.puts("#{ task },")
    end
    out_file.puts("```")
    out_file.puts
  end

  def self.print_do_year(do_year)
    make_out_dir
    year = do_year.year 
    out_file = File.new("#{OUT_DIR}/DO_#{ '%04d' % year }.md", "w")
    do_year.weeks.each do | week |
      week.days.each do | day |
        self.print_tasks(out_file, day)
      end
    end
  end

  def self.print_do_month(do_year, month)
    make_out_dir
    year = do_year.year 
    out_file = File.new("#{OUT_DIR}/DO_#{ '%04d' % year }_#{ '%02d' % month }.md", "w")
    do_year.weeks.each do | week |
      week.days.each do | day |
        if day.month == month
          self.print_tasks(out_file, day)
        end
      end
    end
  end

  def self.print_lg(do_year)
    make_out_dir
    year = do_year.year
    out_file = File.new("#{OUT_DIR}/LG_#{ '%04d' % year }.md", "w")

    weekday_string = "\n### Do\n\n```text\n```\n\n### Scrum\n\n"
    weekend_string = "\n### Do\n\n```text\n```\n\n"

    do_year.weeks.each do | week |
      week.days.each do | day |
        out_file.puts("## #{ '%04d' % day.year }-#{ '%02d' % day.month }-#{ '%02d' % day.month_day } | #{day.name}")
        if day.name == 'Saturday' || day.name == 'Sunday'
          out_file.puts(weekend_string)
        else
          out_file.puts(weekday_string)
        end
      end
    end
  end

end

