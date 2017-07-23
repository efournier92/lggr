module Cal_Tools
  def self.get_first_monday(year)
    years_since = year - 1
    leap_years = years_since / 4
    century_years = years_since / 100
    four_century_years = years_since / 400

    total_leap_years = leap_years - century_years + four_century_years
    total_precesion = years_since + total_leap_years
    day_index = total_precesion % 7

    first_monday = 7 - day_index + 1;
  end

  def self.get_first_friday(year)
    first_sunday = get_first_sunday(year) - 1
    if first_sunday >= 2
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
end

