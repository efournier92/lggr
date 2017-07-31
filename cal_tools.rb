require 'pry'

module Cal_Tools
  def self.days_in_months
    [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
  end

  def self.lg_day_names
    ['Fri', 'Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu']
  end

  def self.do_day_names
    ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
  end

  def self.get_first_monday(year)
    years_since = year - 1
    leap_years = years_since / 4
    century_years = years_since / 100
    four_century_years = years_since / 400

    total_leap_years = leap_years - century_years + four_century_years
    total_precesion = years_since + total_leap_years
    day_index = total_precesion % 7

    first_monday = 8 - day_index;

    if first_monday > 7
      first_monday = first_monday - 7
    end
    first_monday
  end

  def self.get_first_friday(year)
    first_sunday = Cal_Tools.get_first_monday(year) - 1
    if first_sunday > 2
      first_friday = first_sunday - 2
    else
      first_friday = first_sunday + 5
    end
  end

  def self.is_leap_year?(year)
    if (year % 4 == 0 && !(year % 100 == 0 && year % 400 != 0))
      true 
    else
      false 
    end
  end

  def self.days_this_week(day, month)
    day_array = []
    days_in_month = Cal_Tools.days_in_months[month-1]
    7.times do
      if day > days_in_month
        day = 1
      end
      day_array.push(day)
      day += 1
    end
    day_array
  end

  def self.is_first_friday_of_month?(year)

  end

  def self.is_week_odd?(do_week, week_index)
    if week_index.odd?
      do_week['Sun'] = Templates.do_week_odd_sunday
    end
    do_week
  end

  def self.month_start(do_week, days_this_week)
    first_index = days_this_week.index(1)

    if first_index
      day_of_first = Cal_Tools.do_day_names[first_index]
      do_week[day_of_first].unshift('GtScrpts')
      do_week['Sun'].unshift('FrsRzrs')
      do_week[day_of_first].unshift('PyRnt')
    end
    do_week
  end 

  def self.month_end(do_week, days_this_week)
    index_of_26th = days_this_week.index(26)

    if index_of_26th 
      day_of_26th = Cal_Tools.do_day_names[index_of_26th]
      if day_of_26th == 'Sat' || day_of_26th == 'Sun' && index_of_26th != 6
        day_of_26th = 'Mon'
      elsif day_of_26th == 'Sat' || day_of_26th == 'Sun' && index_of_26th == 6
        day_of_26th = 'Fri'
      end
      do_week[day_of_26th].unshift('ByTrnTk')
    end
    do_week
  end 
end

