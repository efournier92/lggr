class Year
  def initialize(year)
    @year = year
    @weeks = []
    month = 1
    week_index = 1
    days_in_months = Year.days_in_months
    day = Cal_Tools.get_first_monday(year)

    52.times do
      days_this_week = Week.days_this_week(day, month)
      do_week = Week.new(week_index, days_this_week, month)

      if do_week.week_index.odd?
        do_week.days.find do |day|
          if day.name == 'Sun'
            day.tasks = Day.odd_sunday_tasks 
          end
        end
      end

      # do_week = Cal_Tools.month_end(do_week, do_week.days)
      # do_week = Cal_Tools.month_start(do_week, week_index, do_week.days, month)

      @weeks.push(do_week)
      day += 7
      if day > days_in_months[month - 1]
        day = day - days_in_months[month - 1]
        month += 1
      end
      first_day_of_month = nil
      week_index += 1
    end
    @weeks.each do |week|
      week.days.each do |day|
        if day.month == 2 && day.month_day == 14
          day.tasks.unshift('[Valentines]')
        elsif day.month == 12 && day.month_day == 25
          day.tasks.unshift('[Christmas]')
        end
      end
    end
    binding.pry
  end

  def self.days_in_months
    [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
  end
end
