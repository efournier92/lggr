require './constants/config_constants'

module Add_Tag

  def self.to_specific_date(do_year, config)
    month = config[CONFIG_KEYS[:MONTH]]
    month_day = config[CONFIG_KEYS[:DAY]]
    new_tag = config[CONFIG_KEYS[:TAG]]

    day_count = 0
    do_year.weeks.each do | week |
        week.days.each do | day |
        if day.month == month && day.month_day == month_day
          day.tasks.prepend(new_tag)
        end
      end
    end
    do_year
  end

  def self.to_nth_xday_in_month(do_year, config)
    month = config.month
    nth_day = config.month_day
    day_name = config.day_name
    new_tag = config.new_tag

    day_count = 0
    do_year.weeks.each do | week |
      week.days.each do | day |
        if day.month == month && day.name == day_name
          day_count += 1
          if day_count == nth_day
            day.tasks.unshift(new_tag)
          end
        end
      end
    end
    do_year
  end

  def self.to_xday_every_n_weeks(do_year, month, week_interval, xday_name, new_tag, offset=0)
    do_year.weeks.each do | week |
      week.days.each do | day |
        if day.month == month && day.name == xday_name && (offset + week.index) % week_interval == 0
          day.tasks.unshift(new_tag)
        end
      end
    end
    do_year
  end

  def self.to_last_week_in_month(do_year, month, day_name, new_tag)
    do_year.weeks.each do | week |
      week.days.each do | day |
      last_week_in_month_start_date = Year.days_in_months[2] - 6
        if day.month == month && day.name == day_name &&
            day.month_day >= last_week_in_month_start_date
          day.tasks.unshift(new_tag)
        end
      end
    end
    do_year
  end

  def self.to_last_day_of_month(do_year, month, new_tag)
    last_day_of_month = Year.days_in_months[month - 1]
    Add_Tag.to_specific_date(do_year, month, last_day_of_month, new_tag)
  end

end
