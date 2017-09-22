module Bookend_Weeks

  def self.shift_do_start(do_year)
    while do_year.weeks.first.days.all? { | day | day.month == 12 }
      do_year.weeks.shift
    end
    do_year
  end

  def self.shift_lg_start(do_year)
    until do_year.weeks.first.days.any? { | day | day.month == 1 }
      first_day = do_year.weeks.first.days.first.month_day
      first_day_month = do_year.weeks.first.days.first.month
      binding.pry
      break if first_day_month == 12 && first_day >= 25
      do_year.weeks.shift 
    end
    do_year.weeks.first.days.shift(5)
    do_year
  end

  def self.shift_do_end(do_year)
    while do_year.weeks.last.days.all? { | day | day.month == 1 }
      do_year.weeks.pop
    end
    do_year
  end

  def self.shift_lg_end(do_year)
    while do_year.weeks.last.days.all? { | day | day.month == 1 }
      do_year.weeks.pop
    end
    do_year.weeks.last.days.pop(2)
    do_year
  end

  # def self.shift_do_end(do_year)
  #   # index of Monday if 'DO', Friday otherwise
  #   day_index = print_type == 'DO' ? 0 : 4
  #   # conditionally set day index
  #   # shift index represents the amount to shave off first & last week
  #   if print_type == 'DO'
  #     day_index = 0; shift_index = 0
  #   elsif print_type == 'LG' && is_start_of_year
  #     day_index = 5; shift_index = 5
  #   elsif print_type == 'LG' && !is_start_of_year
  #     day_index = 4; shift_index = 2
  #   end
  #   # set first & second week to check
  #   # set bordering month to check which week should be first/last
  #   if is_start_of_year
  #     first_week = 1; second_week = 0; cutoff_month = 12
  #   else
  #     total_weeks = do_year.weeks.length
  #     first_week = total_weeks - 2; second_week = total_weeks - 1; cutoff_month = 1
  #   end
  #   # 
  #   if do_year.weeks[first_week].days[day_index].month == cutoff_month
  #     is_start_of_year ? 
  #       do_year.weeks[first_week].days.shift(shift_index) :
  #       do_year.weeks[first_week].days.pop(shift_index)
  #     if is_start_of_year
  #       until do_year.weeks[first_week].days[day_index].month == cutoff_month do
  #         is_start_of_year ? do_year.weeks.shift : do_year.weeks.pop
  #         first_week -= 1 if !is_start_of_year
  #         second_week -= 1 if !is_start_of_year
  #       end
  #     else
  #       while do_year.weeks[first_week].days[day_index].month == cutoff_month do
  #         is_start_of_year ? do_year.weeks.shift : do_year.weeks.pop
  #         first_week -= 1 if !is_start_of_year
  #         second_week -= 1 if !is_start_of_year
  #       end
  #     end
  #   else
  #     is_start_of_year ?
  #       do_year.weeks[second_week].days.shift(shift_index) :
  #       do_year.weeks[second_week].days.pop(shift_index)
  #   end
  #   do_year
  # end
  # end

  # def self.shift_start_days(do_year, print_type, is_start_of_year)
  #   # index of Monday if 'DO', Friday otherwise
  #   day_index = print_type == 'DO' ? 0 : 4
  #   # conditionally set day index
  #   # shift index represents the amount to shave off first & last week
  #   if print_type == 'DO'
  #     day_index = 0; shift_index = 0
  #   elsif print_type == 'LG' && is_start_of_year
  #     day_index = 5; shift_index = 5
  #   elsif print_type == 'LG' && !is_start_of_year
  #     day_index = 4; shift_index = 2
  #   end
  #   # set first & second week to check
  #   # set bordering month to check which week should be first/last
  #   if is_start_of_year
  #     first_week = 1; second_week = 0; cutoff_month = 12
  #   else
  #     total_weeks = do_year.weeks.length
  #     first_week = total_weeks - 2; second_week = total_weeks - 1; cutoff_month = 1
  #   end
  #   # 
  #   if do_year.weeks[first_week].days[day_index].month == cutoff_month
  #     is_start_of_year ? 
  #       do_year.weeks[first_week].days.shift(shift_index) :
  #       do_year.weeks[first_week].days.pop(shift_index)
  #     if is_start_of_year
  #       until do_year.weeks[first_week].days[day_index].month == cutoff_month do
  #         is_start_of_year ? do_year.weeks.shift : do_year.weeks.pop
  #         first_week -= 1 if !is_start_of_year
  #         second_week -= 1 if !is_start_of_year
  #       end
  #     else
  #       while do_year.weeks[first_week].days[day_index].month == cutoff_month do
  #         is_start_of_year ? do_year.weeks.shift : do_year.weeks.pop
  #         first_week -= 1 if !is_start_of_year
  #         second_week -= 1 if !is_start_of_year
  #       end
  #     end
  #   else
  #     is_start_of_year ?
  #       do_year.weeks[second_week].days.shift(shift_index) :
  #       do_year.weeks[second_week].days.pop(shift_index)
  #   end
  #   do_year
  # end
end
