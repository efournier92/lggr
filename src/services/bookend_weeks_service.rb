class BookendWeeksService
  def shift_do_start(do_year)
    do_year.weeks.shift while do_year.weeks.first.days.all? { |day| day.month == 12 }
    do_year
  end

  def shift_lg_start(do_year)
    until do_year.weeks.first.days.any? { |day| day.month == 1 }
      first_day = do_year.weeks.first.days.first.month_day
      first_day_month = do_year.weeks.first.days.first.month
      break if first_day_month == 12 && first_day >= 21

      do_year.weeks.shift
    end
    do_year.weeks.first.days.shift(5)
    do_year
  end

  def shift_do_end(do_year)
    do_year.weeks.pop while do_year.weeks.last.days.all? { |day| day.month == 1 }
    do_year
  end

  def shift_lg_end(do_year)
    while do_year.weeks.last.days.all? { |day| day.month == 1 }
      first_day = do_year.weeks.last.days.first.month_day
      last_day_month = do_year.weeks.last.days.last.month
      break if last_day_month == 1 && first_day == 1

      do_year.weeks.pop
    end
    do_year.weeks.last.days.pop(2)
    do_year
  end
end
