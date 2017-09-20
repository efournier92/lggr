module Holidays

  def easter(year)
    epact_calc = ( 24 + 19 * ( year % 19 ) ) % 30
    paschal_days = epact_calc - ( epact_calc / 28 )
    days_to_sunday = paschal_days - (
      ( year + ( year / 4 ) + paschal_days - 13 ) % 7
    )
    easter_month = 3 + ( days_to_sunday + 40 ) / 44
    easter_day = days_to_sunday + 28 - (
      31 * ( easter_month / 4 )
    )
    { month: easter_month, day: easter_day }
  end

end
