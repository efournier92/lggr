require './src/models/year'
require './src/services/printer_service'
require './src/services/bookend_weeks_service'
require './src/services/add_tag_service'
require './src/constants/app_constants'

# Main class to kickstart the file-printing process according to initialized values
class LogSketcher
  attr_reader :mode, :year, :month

  def initialize(config_file, mode, year, month, output_directory = nil)
    @config_file = config_file
    @mode = mode
    @year = year
    @month = month
    @output_directory = output_directory
  end

  def print_file
    collect_user_input
    print_by_mode
  end

  def collect_user_input
    prompt_for_mode_input until valid_mode?

    prompt_for_year_input until valid_year?

    prompt_for_month_input until valid_month?
  end

  def print_by_mode
    bookend_weeks_service = BookendWeeksService.new
    printer_service = PrinterService.new(@output_directory)
    do_year = Year.new(@year, @config_file)

    if @mode == AppConstants::MODES[:DO]
      print_do_mode(do_year, printer_service, bookend_weeks_service)
    elsif @mode == AppConstants::MODES[:LG]
      print_lg_mode(do_year, printer_service, bookend_weeks_service)
    end
  end

  def print_do_mode(do_year, printer_service, bookend_weeks_service)
    do_year = bookend_weeks_service.shift_do_start(do_year)
    do_year = bookend_weeks_service.shift_do_start(do_year)
    do_year = bookend_weeks_service.shift_do_end(do_year)

    if print_month?
      printer_service.print_do_month(do_year, @month)
    else
      printer_service.print_do_year(do_year)
    end
  end

  def print_lg_mode(do_year, printer_service, bookend_weeks_service)
    do_year = bookend_weeks_service.shift_lg_start(do_year)
    do_year = bookend_weeks_service.shift_lg_end(do_year)
    printer_service.print_lg(do_year)
  end

  def prompt_for_mode_input
    print AppConstants::INPUT_PROMPTS[:MODE]
    @mode = $stdin&.gets&.chomp&.upcase
  end

  def prompt_for_year_input
    print AppConstants::INPUT_PROMPTS[:YEAR]
    @year = $stdin&.gets&.chomp.to_i
  end

  def prompt_for_month_input
    print AppConstants::INPUT_PROMPTS[:MONTH]
    @month = $stdin&.gets&.chomp&.upcase
    @month = @month.to_i if valid_month_pattern?
  end

  def lg_mode?
    @mode == AppConstants::MODES[:LG]
  end

  def all_mode?
    @month == AppConstants::MODES[:ALL]
  end

  def valid_month_number?
    !@month.nil? && @month.to_i.positive? && @month.to_i <= 12
  end

  def valid_month_pattern?
    !@month.nil? && @month.is_a?(String) && @month.match?(AppConstants::REGEX[:VALID_MONTH])
  end

  def valid_month?
    lg_mode? || all_mode? || valid_month_number?
  end

  def all_month?
    @month == AppConstants::MODES[:ALL]
  end

  def valid_mode?
    @mode == AppConstants::MODES[:DO] || @mode == AppConstants::MODES[:LG]
  end

  def valid_year?
    @year.is_a?(Integer) && @year.positive?
  end

  def print_month?
    !@month.nil? && @month.is_a?(Integer) && @month&.positive?
  end
end
