require './src/models/week'
require './src/services/special_tag_service'

class Year
  attr_accessor :weeks
  attr_reader :year, :days_in_months, :config_file

  def initialize(year, config_file)
    @year  = year
    @weeks = []
    month  = 1
    week_index = 1
    @days_in_months = Year.days_in_months
    # adjust for leap year
    @days_in_months[1] = 29 if leap_year?
    day = Year.get_first_monday(year)
    @config_file = config_file

    week_index = 1
    first_monday = day
    add_first_week(first_monday - 7)
    add_first_week(first_monday)

    54.times do
      month = 1 if month == 13
      days_this_week = Week.days_this_week(day, month, @days_in_months)
      do_week = Week.new(week_index, days_this_week, year, month, @config_file)
      year = do_week.year
      @weeks.push(do_week)
      # increment for next week
      day += 7
      # check if new month
      if day > days_in_months[month - 1]
        day -= days_in_months[month - 1]
        month += 1
      end
      week_index += 1
    end

    add_special_tags
  end

  def add_first_week(first_monday)
    last_monday = 31 - (7 - first_monday)
    days_this_week = Week.days_this_week(last_monday, 1, @days_in_months)
    year = @year - 1
    first_week = Week.new(0, days_this_week, year, 12, @config_file)
    @weeks.push(first_week)
  end

  def add_final_week
    last_day_of_previous_year = @weeks.last.days.last
    last_monday_of_previous_year = last_day_of_previous_year.month_day
    return unless last_day_of_previous_year.month != 1

    days_this_week = Week.days_this_week(last_monday_of_previous_year,
                                         12, @days_in_months)
    final_week = Week.new(53, days_this_week, last_day_of_previous_year.year, 12, @config_file)
    @weeks.push(final_week)
  end

  def self.days_in_months
    [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  end

  def leap_year?
    (@year % 4).zero? && !((@year % 100).zero? && @year % 400 != 0)
  end

  def self.get_first_monday(year)
    years_since = year - 1
    leap_years = years_since / 4
    century_years = years_since / 100
    four_century_years = years_since / 400

    total_leap_years = leap_years - century_years + four_century_years
    total_precesion = years_since + total_leap_years
    day_index = total_precesion % 7

    first_monday = 8 - day_index

    first_monday -= 7 if first_monday > 7
    first_monday
  end

  def add_special_tags
    add_tags_service = SpecialTagService.new
    add_tags_service.add_special_tags(self)
  end
end
