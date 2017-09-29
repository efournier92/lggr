module Add_Tag 
  def self.to_specific_date(do_year, month, month_day, description_tag)
    day_count = 0
    do_year.weeks.each do | week |
        week.days.each do | day |
        if day.month == month && day.month_day == month_day 
            day.tasks.unshift(description_tag)
        end
      end
    end
    do_year
  end

  def self.to_nth_day_in_month(do_year, month, nth_day, day_name, description_tag)
    day_count = 0
    do_year.weeks.each do | week |
      week.days.each do | day |
        if day.month == month && day.name == day_name 
          day_count += 1
          if day_count == nth_day
            day.tasks.unshift(description_tag)
          end
        end
      end
    end
    do_year
  end

  def self.to_last_week_in_month(do_year, month, day_name, description_tag)
    do_year.weeks.each do | week |
      week.days.each do | day |
      last_week_in_month_start_date = Year.days_in_months[2] - 6
        if day.month == month && day.name == day_name && 
            day.month_day >= last_week_in_month_start_date
          day.tasks.unshift(description_tag)
        end
      end
    end
    do_year
  end
end 

