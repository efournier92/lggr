require 'fileutils'

class PrinterService
  DEFAULT_OUTPUT_DIR = './'.freeze

  def initialize(output_dir = DEFAULT_OUTPUT_DIR)
    @output_dir = output_dir || DEFAULT_OUTPUT_DIR
  end

  def make_out_dir
    FileUtils.mkdir_p @output_dir
  end

  def print_tasks(out_file, day)
    make_out_dir
    out_file.puts(date_line(day).to_s)
    out_file.puts
    out_file.puts(markdown_block_opener)
    out_file.puts(day.tasks.to_s)
    out_file.puts('```')
    out_file.puts
  end

  def date_line(day)
    "## #{format('%04d', day.year)}-#{format('%02d', day.month)}-#{format('%02d', day.month_day)} | #{day.name}"
  end

  def markdown_block_opener
    "```text\n"
  end

  def markdown_block_closer
    '```'
  end

  def do_block_opener
    "\n### Do\n\n```text\n```\n\n"
  end

  def do_file_name(year, month = nil)
    if !month.nil?
      "#{@output_dir}/DO_#{format('%04d', year)}_#{format('%02d', month)}.md"
    else
      "#{@output_dir}/DO_#{format('%04d', year)}.md"
    end
  end

  def lg_file_name(year)
    "#{@output_dir}/LG_#{format('%04d', year)}.md"
  end

  def print_do_year(do_year)
    make_out_dir
    year = do_year.year_number
    out_file = File.new(do_file_name(year), 'w')
    do_year.days.each do |day|
      print_tasks(out_file, day)
    end
  end

  def print_do_month(do_year, month)
    make_out_dir
    year = do_year.year_number
    out_file = File.new(do_file_name(year, month), 'w')
    do_year.days.each do |day|
      print_tasks(out_file, day) if day.month == month
    end
  end

  def print_lg(do_year)
    make_out_dir
    year = do_year.year_number
    out_file = File.new(lg_file_name(year), 'w')

    template_base = do_block_opener
    # TODO: Move to template
    template_weekday = "#{template_base}### Scrum\n\n#### Yesterday\n\n#### Today\n\n#### Parking Lot\n\n"
    template_monday  = "#{template_base}### Scrum\n\n#### Last Friday\n\n#### Today\n\n#### Parking Lot\n\n"

    do_year.weeks.each do |week|
      week.days.each do |day|
        out_file.puts(date_line(day))
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
