module Annual

  def self.add_all(do_year)
    # New Year's Day
    do_year = add_tag_service.to_specific_date(
      do_year, 1, 1, "[Holiday_NewYearsDay]"
    )

    # President's Day
    do_year = add_tag_service.to_nth_xday_in_month(
      do_year, 2, 3, "Monday", "[Holiday_PresidentsDay]"
    )

    # Valentine's Day
    do_year = add_tag_service.to_specific_date(
      do_year, 2, 14, "[Holiday_ValentinesDay]"
    )

    # Daylight Savings (Begin)
    do_year = add_tag_service.to_nth_xday_in_month(
      do_year, 3, 2, "Sunday", "[DaylightSaving_Begins],\nClocks_Time_Set(BlueAlarm,)"
    )

    # Easter & Good Friday
    do_year = Annual.easter_and_good_friday(
      do_year
    )

    # Mother's Day
    do_year = add_tag_service.to_nth_xday_in_month(
      do_year, 5, 2, "Sunday", "[Holiday_MothersDay]"
    )

    # Memorial Day
    do_year = add_tag_service.to_last_week_in_month(
      do_year, 5, "Monday", "[Holiday_MemorialDay]"
    )

    # Father's Day
    do_year = add_tag_service.to_nth_xday_in_month(
      do_year, 6, 3, "Sunday", "[Holiday_FathersDay]"
    )

    # Juneteenth
    do_year = add_tag_service.to_specific_date(
      do_year, 6, 19, "[Holiday_Juneteenth]"
    )

    # Independence Day
    do_year = add_tag_service.to_specific_date(
      do_year, 7, 4, "[Holiday_IndependenceDay]"
    )

    # Labor Day
    do_year = add_tag_service.to_nth_xday_in_month(
      do_year, 9, 1, "Monday", "[Holiday_LaborDay]"
    )

    # Halloween
    do_year = add_tag_service.to_specific_date(
      do_year, 10, 31, "[Holiday_Halloween]"
    )

    # Veterans Day
    do_year = add_tag_service.to_specific_date(
      do_year, 11, 11, "[Holiday_VeteransDay]"
    )

    # Daylight Savings (End)
    do_year = add_tag_service.to_nth_xday_in_month(
      do_year, 11, 1, "Sunday", "[DaylightSaving_Ends],\nClocks_Time_Set(BlueAlarm,)"
    )

    # Thanksgiving
    do_year = add_tag_service.to_nth_xday_in_month(
      do_year, 11, 4, "Thursday", "[Holiday_Thanksgiving]"
    )

    # Christmas Eve
    do_year = add_tag_service.to_specific_date(
      do_year, 12, 24, "[Holiday_ChristmasEve],\nBill_Phone_Verizon_Dad_Pay($480,)"
    )

    # Christmas
    do_year = add_tag_service.to_specific_date(
      do_year, 12, 25, "[Holiday_Christmas]"
    )

    # New Year's Eve
    do_year = add_tag_service.to_specific_date(
      do_year, 12, 31, "[Holiday_NewYearsEve]"
    )

  end

  def self.easter_and_good_friday(do_year)
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

    days_in_good_friday_month = Year.days_in_months[good_friday_month - 1]

    if easter_day == 2
      good_friday_day = days_in_good_friday_month
    elsif easter_day == 1
      good_friday_day = days_in_good_friday_month - 1
    else
      good_friday_day = easter_day - 2
    end

    do_year.weeks.each do | week |
      week.days.each do | day |
        if day.month == easter_month && day.month_day == easter_day
          day.tasks.unshift("[Easter]")
        end
        if day.month == good_friday_month && day.month_day == good_friday_day
          day.tasks.unshift("[Good Friday]")
        end
      end
    end
    do_year
  end

end
