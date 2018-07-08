class Week

  attr_reader   :year, :month, :days
  attr_accessor :index, :days_this_week

  def initialize(index, days_this_week, year, month)
    @index = index
    @month = month
    @year = year
    @days_this_week = days_this_week
    @days = []

   last_day = 0
    Week.days.each_with_index do | (day_name, day_tasks), index |
      month_day = days_this_week[index]
      # increment month if it's a new month
      month += 1 if month_day < last_day
      # reset to January after December
      month = 1 if month == 13
      # adjust year on January 1st
      year += 1 if month == 1 && month_day == 1 && ( @index > 5 || index != 0 )
      day = Day.new(day_name, day_tasks, year, month, month_day)
      @days.push(day)
      last_day = month_day 
    end
  end

  def self.days
    { 
      'Monday'    => ['Af_Rcv(<0800)', 'Gt', 'Ktch_Cln(Frdg)', 'Trsh_Out', 'Ap_Hnd'],
      'Tuesday'   => ['Gt', 'Ap_Hnd'],
      'Wednesday' => ['Gt', 'Ap_Hnd', '[NoBo]'],
      'Thursday'  => ['Gt', 'Sv', 'Plk', 'Ns', 'Ap_Hnd'],
      'Friday'    => ['Bdgt', 'Cc_Py', 'V1_Hrs_Brn', 'Gt', 'Lg_aLg', 
                      'Lg_[R]s_Fn', 'Lg_LstWk', 'Lg_NxtWk', 'Hr_Wsh', 'Ap_Hnd'],
      'Saturday'  => ['Amz_Ord()', 'Af_Ord()', 'Gt', 'Ap_Hnd'],
      'Sunday'    => ['Gt', 'Bk(Bnk-bnkA, extA-extB, sda3-bkA)', 
                      'Mm&Dd_Cl(1300, )', 'Apt_Vcm', 'Ktch_Cln(Snk)', 
                      'Bthrm_Cln(Tlt, Snk)', 'Mcbk_Cln(Scrn, Kybrd)', 
                      'AfBg_DwnStrs', 'Hr_LnUp', 'Ap_Hnd', '[NoBo]']
    }
  end

  def self.days_this_week(day, month, days_in_months)
    day_array = []
    days_in_month = days_in_months[month - 1]
    7.times do
      if day > days_in_month
        day = 1
      end
      day_array.push(day)
      day += 1
    end
    day_array
  end

  def self.add_first_week(do_year)
    do_year.
    last_monday_of_previous_year = 31 - ( 7 - first_day )
    days_this_week = Week.days_this_week(last_monday_of_previous_year, 
                                          1, @days_in_months)
    year = @year - 1
    first_week = Week.new(0, days_this_week, year, 12)
    @weeks.push(first_week)
  end

  def self.add_final_week
    last_day_of_previous_year = @weeks.last.days.last
    last_monday_of_previous_year = last_day_of_previous_year.month_day
    if last_day_of_previous_year.month != 1
      days_this_week = Week.days_this_week(last_monday_of_previous_year, 
                                          12, @days_in_months)
      final_week = Week.new(53, days_this_week, last_day_of_previous_year.year, 12)
      @weeks.push(final_week)
    end
  end

end

