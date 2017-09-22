module Holidays
  def self.labor_day(do_year)
    do_year.weeks.each do | week |
      week.days.each do | day |
        if day.month == 9 && day.name == 'Mon'
          day.tasks.unshift('[Memorial_Day]')
          break
        end
      end
    end
  end

  def self.add_all(do_year)
    # New Year's Day
    do_year = Holidays.add_to_specific_date(do_year, 1, 1, "[New_Year's_Day]") 
    # Presdent's Day
    do_year = Holidays.add_to_nth_day_in_month(do_year, 2, 3, 'Mon', "[President's_Day]")
    # Daylight Savings (Begin)
    do_year = Holidays.add_to_nth_day_in_month(do_year, 3, 2, 'Sun', "[Daylight_Saving(Begin)]")
    # Good Friday
    # Easter
    do_year = Holidays.add_easter(do_year)
    # Memorial Day
    find_last_occurance_in_month(do_year, 5, 'Mon', "[Memorial_Day]")
    # Independence Day
    do_year = Holidays.add_to_specific_date(do_year, 7, 4, "[Independence_Day]") 
    # Labor Day
    do_year = Holidays.add_to_nth_day_in_month(do_year, 9, 1, 'Mon', "[Daylight_Saving(Begin)]")
    # Veterans Day
    do_year = Holidays.add_to_specific_date(do_year, 11, 11, "[Veteran's_Day]") 
    # Daylight Savings (End)
    do_year = Holidays.add_to_nth_day_in_month(do_year, 11, 1, 'Sun', "Daylight_Saving(Begin)")
    # Thanksgiving
    do_year = Holidays.add_to_nth_day_in_month(do_year, 11, 4, 'Sun', "Thanksgiving")
    # Christmas
    do_year = Holidays.add_to_specific_date(do_year, 12, 25, "[Christmas]") 
    # New Year's Eve 
    do_year = Holidays.add_to_specific_date(do_year, 12, 31, "[New_Year's_Eve]") 
  end

  def self.add_to_specific_date(do_year, month, month_day, holiday_name)
    day_count = 0
    do_year.weeks.each do | week |
      week.days.each do | day |
      if day.month == month && day.month_day == month_day 
        if day_count == nth_day
          day.tasks.unshift(holiday_name)
        end
      end
    end
    end
    do_year
  end

  def self.add_to_nth_day_in_month(do_year, month, nth_day, day_name, holiday_name)
    day_count = 0
    do_year.weeks.each do | week |
      week.days.each do | day |
      if day.month == month && day.name == day_name 
        day_count += 1
        if day_count == nth_day
          day.tasks.unshift(holiday_name)
        end
      end
    end
    end
    do_year
  end

  def self.find_last_occurance_in_month(do_year, month, day_name, holiday_name)
    do_year.weeks.each do | week |
      week.days.each do | day |
      last_week_in_month_start_date = days_in_months[2] - 6
      if day.month == month && day.name == day_name 
        && day.month_day >= last_week_in_month_start_date
        day.tasks.unshift(holiday_name)
      end
    end
    end
    do_year
  end

  def self.memorial_day(do_year)
    do_year.weeks.each do | week |
      week.days.each do | day |
      if day.month == 5 && day.name == 'Mon' && day.month_day >= 25
        day.tasks.unshift('[Memorial_Day]')
        break
      end
    end
    end
    do_year
  end

  def self.add_easter(do_year)
    year = do_year.year
    epact_calc = ( 24 + 19 * ( year % 19 ) ) % 30
    paschal_days = epact_calc - ( epact_calc / 28 )
    days_to_sunday = paschal_days - (
      ( year + ( year / 4 ) + paschal_days - 13 ) % 7
    )
    easter_month = 3 + ( days_to_sunday + 40 ) / 44
    easter_day = days_to_sunday + 28 - (
      31 * ( easter_month / 4 )
    )

    good_friday_month = 
      easter_day > 2 
        ? easter_month
        : easter_month - 1

    good_friday_day = 
      easter_day > 2 
        ? easter_day - 2
        : Year.days_in_months[good_friday_month - 1] - ( easter_day - 1 )

    do_year.weeks.each do | week |
      week.days.each do | day |
      if day.month == easter_month && day.month_day == easter_day
        day.tasks.unshift('[Easter]')
      end
      if day.month == good_friday_month && day.month_day == good_friday_day
        day.tasks.unshift('[Easter]')
      end
    end
    end
    do_year
  end

  def self.thanksgiving(do_year)
    november_thursdays = []
    november_thursdays_count = 0
    do_year.weeks.each do | week |
      week.days.each do | day |
      if day.month == 11 && day.name == 'Thu'
        november_thursdays_count += 1
        if november_thursdays_count == 4
          day.tasks.unshift('[Thanksgiving]')
        end
      end
    end
    end
  end
end
