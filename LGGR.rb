require 'pry'

require './models/Day'
require './models/Month'
require './models/Week'
require './models/Year'
require './models/Task'
require './modules/Add_Tag'
require './modules/Birthdays'
require './modules/Bookend_Weeks'
require './modules/Annual'
require './modules/Printer'

class Lggr

  def initialize(config_file = '', print_type = '', print_year = nil, print_month = nil)
    @config_file = config_file
    @print_type = print_type
    @print_year = print_year
    @print_month = print_month
    @month = 1
  end

  def main()
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
    if @print_type == 'DO' && !@print_month.is_a?(Integer)
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
    #do_year = Month.add_start_tasks(do_year)
    # add birthdays to year object
    #do_year = Year.add_birthdays(do_year)
    # add annual tasks to year object
    #do_year = Year.add_annual_tasks(do_year)

    if @print_type == 'DO'
      do_year = Bookend_Weeks.shift_do_start(do_year)
      do_year = Bookend_Weeks.shift_do_start(do_year)
      do_year = Bookend_Weeks.shift_do_end(do_year)

      if @print_month.is_a? Integer
        Printer.print_do_month(do_year, @print_month)
      else
        Printer.print_do_year(do_year)
      end
    elsif @print_type == 'LG'
      do_year = Bookend_Weeks.shift_lg_start(do_year)
      do_year = Bookend_Weeks.shift_lg_end(do_year)
      Printer.print_lg(do_year)
    end
  end
end

# arguments = ARGV

# config_file = arguments[0].is_a?(String) && File.exist?(arguments[0]) ? arguments[0] : ''
# print_type = arguments[1] == 'LG' || arguments[1] == 'DO' ? arguments[1] : ''
# print_year = arguments[2].to_i.is_a?(Integer) ? arguments[2].to_i : nil
# print_month = arguments[3].to_i.is_a?(Integer) ? arguments[3].to_i : nil

# lggr = Lggr.new(config_file, print_type, print_year, print_month)
# lggr.main()
