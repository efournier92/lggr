require 'pry'

require './src/models/day'
require './src/models/month'
require './src/models/week'
require './src/models/year'
require './src/services/printer_service'
require './src/services/bookend_weeks_service'
require './src/services/add_tag_service'
require './models/Task'

class LogSketcher
  def initialize(config_file, print_type, print_year, print_month = 'ALL', output_dir = nil)
    @config_file = config_file
    @print_type = print_type
    @print_year = print_year
    @print_month = print_month
    @output_dir = output_dir
    @month = 1
  end

  def main
    # Collect type user input
    until @print_type == 'DO' || @print_type == 'LG'
      print "DO || LG\n>> "
      @print_type = gets.chomp.upcase
    end

    # Collect year user input
    until @print_year.is_a?(Integer)
      print "Which Year?\n>> "
      @print_year = gets.chomp.to_i
    end

    # Collect month user input
    if @print_type == 'DO' && (!@print_month.is_a?(Integer) && @print_month != 'ALL')
      is_valid = false
      until is_valid == true
        print "MONTH: All || [1-12]\n>> "
        @print_month = gets.chomp.upcase
        is_valid = true if @print_month == 'ALL' || @print_month == 'A'
        if @print_month.match(/^([1-9]|[01][0-2])$/)
          is_valid = true
          @print_month = @print_month.to_i
        end
      end
    end

    # create year object
    do_year = Year.new(@print_year, @config_file)

    # add monthly tasks to year object
    # do_year = Month.add_start_tasks(do_year)
    # add birthdays to year object
    # do_year = Year.add_birthdays(do_year)
    # add annual tasks to year object
    # do_year = Year.add_annual_tasks(do_year)
    # do_year = do_year.add_special_tags()

    if @print_type == 'DO'
      printer_service = PrinterService.new(@output_dir)
      bookend_weeks_service = BookendWeeksService.new

      do_year = bookend_weeks_service.shift_do_start(do_year)
      do_year = bookend_weeks_service.shift_do_start(do_year)
      do_year = bookend_weeks_service.shift_do_end(do_year)

      if !@print_month.nil? && @print_month.is_a?(Integer) && @print_month.positive?
        printer_service.print_do_month(do_year, @print_month)
      else
        printer_service.print_do_year(do_year)
      end

    elsif @print_type == 'LG'
      do_year = bookend_weeks_service.shift_lg_start(do_year)
      do_year = bookend_weeks_service.shift_lg_end(do_year)
      printer_service.print_lg(do_year)
    end
  end
end
