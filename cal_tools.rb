require 'pry'

module Cal_Tools
  def self.days_in_months
    [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
  end

  def self.day_names
    ['Fri', 'Sat', 'Sun', 'Mon ', 'Tue', 'Wed', 'Thu']
  end

  def self.get_first_monday(year)
    years_since = year - 1
    leap_years = years_since / 4
    century_years = years_since / 100
    four_century_years = years_since / 400

    total_leap_years = leap_years - century_years + four_century_years
    total_precesion = years_since + total_leap_years
    day_index = total_precesion % 7

    first_monday = 8 - day_index;

    if first_monday > 7
      first_monday = first_monday - 7
    end
    first_monday
  end

  def self.get_first_friday(year)
    first_sunday = Cal_Tools.get_first_monday(year) - 1
    if first_sunday > 2
      first_friday = first_sunday - 2
    else
      first_friday = first_sunday + 5
    end
  end

  def self.is_leap_year?(year)
    if (year % 4 == 0 && !(year % 100 == 0 && year % 400 != 0))
      true 
    else
      false 
    end
  end

  def self.days_this_week(first_day)
    arr = []
    7.times do 
      arr.push(first_day)
      first_day += 1
    end
    arr
  end

  def self.is_first_friday_of_month?(year)

  end
end

