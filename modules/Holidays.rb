module Holidays

  def self.add_all(do_year)
    # New Year's Day
    do_year = Add_Tag.to_specific_date(
      do_year, 1, 1, "[New_Year's_Day]"
    )
    # President's Day
    do_year = Add_Tag.to_nth_xday_in_month(
      do_year, 2, 3, 'Mon', "[President's_Day]"
    )
    # Valentine's Day
    do_year = Add_Tag.to_specific_date(
      do_year, 2, 14, "[Valentine's_Day]"
    )
    # Daylight Savings (Begin)
    do_year = Add_Tag.to_nth_xday_in_month(
      do_year, 3, 2, 'Sun', "[Daylight_Saving(Begin)]"
    )
    # Easter & Good Friday
    do_year = Holidays.add_easter_and_good_friday(
      do_year
    )
    # Memorial Day
    do_year = Add_Tag.to_last_week_in_month(
      do_year, 5, 'Mon', "[Memorial_Day]"
    )
    # Independence Day
    do_year = Add_Tag.to_specific_date(
      do_year, 7, 4, "[Independence_Day]"
    )
    # Labor Day
    do_year = Add_Tag.to_nth_xday_in_month(
      do_year, 9, 1, 'Mon', "[Labor_Day]"
    )
    # Veterans Day
    do_year = Add_Tag.to_specific_date(
      do_year, 11, 11, "[Veterans_Day]"
    )
    # Daylight Savings (End)
    do_year = Add_Tag.to_nth_xday_in_month(
      do_year, 11, 1, 'Sun', "[Daylight_Saving(End)]"
    )
    # Thanksgiving
    do_year = Add_Tag.to_nth_xday_in_month(
      do_year, 11, 4, 'Sun', "[Thanksgiving]"
    )
    # Christmas
    do_year = Add_Tag.to_specific_date(
      do_year, 12, 25, "[Christmas]"
    )
    # New Year's Eve 
    do_year = Add_Tag.to_specific_date(
      do_year, 12, 31, "[New_Year's_Eve]"
    )
  end

  def self.add_easter_and_good_friday(do_year)
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

    good_friday_month = easter_day > 2 ? 
      easter_month : easter_month - 1

    good_friday_day = easter_day > 2 ? easter_day - 2 : 
      Year.days_in_months[good_friday_month - 1] - ( easter_day - 1 )

    do_year.weeks.each do | week |
      week.days.each do | day |
        if day.month == easter_month && day.month_day == easter_day
          day.tasks.unshift('[Easter]')
        end
        if day.month == good_friday_month && day.month_day == good_friday_day
          day.tasks.unshift('[Good_Friday]')
        end
      end
    end
    do_year
  end

end

