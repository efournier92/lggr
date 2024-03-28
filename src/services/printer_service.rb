require 'fileutils'

class PrinterService
  DEFAULT_OUTPUT_DIR = './_out'.freeze

  def initialize(output_dir = DEFAULT_OUTPUT_DIR)
    @output_dir = output_dir || DEFAULT_OUTPUT_DIR
  end

  def make_out_dir
    FileUtils.mkdir_p @output_dir
  end

  def print_tasks(out_file, day)
    make_out_dir
    out_file.puts("## #{'%04d' % day.year}-#{'%02d' % day.month}-#{'%02d' % day.month_day} | #{day.name}")
    out_file.puts
    out_file.puts("```text\n")
    out_file.puts(day.tasks.to_s)
    out_file.puts('```')
    out_file.puts
  end

  def print_do_year(do_year)
    make_out_dir
    year = do_year.year
    out_file = File.new("#{@output_dir}/DO_#{'%04d' % year}.md", 'w')
    do_year.weeks.each do |week|
      week.days.each do |day|
        print_tasks(out_file, day)
      end
    end
  end

  def print_do_month(do_year, month)
    make_out_dir
    year = do_year.year
    out_file = File.new("#{@output_dir}/DO_#{'%04d' % year}_#{'%02d' % month}.md", 'w')
    do_year.weeks.each do |week|
      week.days.each do |day|
        print_tasks(out_file, day) if day.month == month
      end
    end
  end

  def print_lg(do_year)
    make_out_dir
    year = do_year.year
    out_file = File.new("#{@output_dir}/LG_#{'%04d' % year}.md", 'w')

    template_base    = "\n### Do\n\n```text\n```\n\n"
    template_weekday = "#{template_base}### Scrum\n\n#### Yesterday\n\n#### Today\n\n#### Parking Lot\n\n"
    template_monday  = "#{template_base}### Scrum\n\n#### Last Friday\n\n#### Today\n\n#### Parking Lot\n\n"

    do_year.weeks.each do |week|
      week.days.each do |day|
        out_file.puts("## #{'%04d' % day.year}-#{'%02d' % day.month}-#{'%02d' % day.month_day} | #{day.name}")
        if day.name == 'Saturday' || day.name == 'Sunday'
          out_file.puts(template_base)
        elsif day.name == 'Monday'
          out_file.puts(template_monday)
        else
          out_file.puts(template_weekday)
        end
      end
    end
  end
end
