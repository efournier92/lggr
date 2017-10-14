module Bookend_Weeks

  def self.shift_start_days(do_year, print_type, is_start_of_year)
    day_index = print_type == 'DO' ? 0 : 4
    if print_type == 'DO'
      day_index = 0; shift_index = 0
    elsif print_type == 'LG' && is_start_of_year
      day_index = 5; shift_index = 5
    elsif print_type == 'LG' && !is_start_of_year
      day_index = 4; shift_index = 2
    end
    if is_start_of_year
      first_week = 1; second_week = 0; cutoff_month = 12
    else
      total_weeks = do_year.weeks.length
      first_week = total_weeks - 2; second_week = total_weeks - 1; cutoff_month = 1
    end
    if do_year.weeks[first_week].days[day_index].month == cutoff_month
      is_start_of_year ? 
        do_year.weeks[first_week].days.shift(shift_index) :
        do_year.weeks[first_week].days.pop(shift_index)
        if is_start_of_year
        until do_year.weeks[first_week].days[day_index].month == cutoff_month do
          is_start_of_year ? do_year.weeks.shift : do_year.weeks.pop
          first_week -= 1 if !is_start_of_year
          second_week -= 1 if !is_start_of_year
        end
        else
        while do_year.weeks[first_week].days[day_index].month == cutoff_month do
          is_start_of_year ? do_year.weeks.shift : do_year.weeks.pop
          first_week -= 1 if !is_start_of_year
          second_week -= 1 if !is_start_of_year
        end
      end
        # is_start_of_year ? do_year.weeks.shift : do_year.weeks.pop
    else
      is_start_of_year ?
        do_year.weeks[second_week].days.shift(shift_index) :
        do_year.weeks[second_week].days.pop(shift_index)
    end
    do_year
  end

end
