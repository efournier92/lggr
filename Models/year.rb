class Year
  def initialize(year)
    @year = year
    @weeks = []
    day = Cal_Tools.get_first_monday(year)

    52.times do
      days_this_week = Week.days_this_week(day, month)
      do_week = Week.new(week_index) 

      if week_index.odd?
        do_week['Sun'] = Templates.do_week_odd_sunday
      end


      do_week.each_with_index do |day, day_details|
        day_details.month = month
        day_details.day = do_week.days_this_week[index]
      end

      do_week.days = Cal_Tools.days_this_week(day, month)

      do_week = Cal_Tools.is_week_odd?(do_week, week_index)
      do_week = Cal_Tools.month_end(do_week, do_week.days)
      do_week = Cal_Tools.month_start(do_week, week_index, do_week.days, month)

      @weeks.push(do_week)
      day += 7
      if day > days_in_month[month - 1]
        day = day - days_in_month[month - 1]
        month += 1
      end
      first_day_of_month = nil
      week_index += 1
    end
  end
end
