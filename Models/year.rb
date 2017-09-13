class Year
  def initialize
    @weeks = []

    52.times do
      do_week = Templates.do_week
      do_week.week_index = week_index

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
    end
  end
end
