module Cal_Tools
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
    days_in_month = Templates.days_in_months[month-1]
    7.times do
      if day > days_in_month
        day = 1
      end
      day_array.push(day)
      day += 1
    end
    day_array
  end

  def self.is_week_odd?(do_week, week_index)
    if week_index.odd?
      do_week['Sun'] = Templates.do_week_odd_sunday
    end
    do_week
  end

  def self.year_start(do_week)
    do_week['Mon'].unshift('PyIntrnt')
    do_week['Sat'].unshift('CtPls')
    do_week['Mon'].unshift('RcvScrpts')
    do_week['Sun'].unshift('FrsRzrs')
    do_week['Sun'].unshift('FrshCntcts')
    do_week['Mon'].unshift('PyRnt')
    do_week
  end

  def self.month_start(do_week, week_index, days_this_week, month)
    start_of_quarters = [1, 4, 7, 10]
    first_index = days_this_week.index(1)

    if week_index == 0 && !first_index
      do_week = Cal_Tools.year_start(do_week)
    end

    if first_index
      day_of_first = Templates.do_day_names[first_index]
      do_week['Sat'].unshift('CtPls')
      do_week[day_of_first].unshift('RcvScrpts')
      do_week[day_of_first].unshift('PyIntrnt')
      do_week['Sun'].unshift('NxBk')
      do_week['Sun'].unshift('FrsRzrs')
      do_week['Sun'].unshift('FrshCntcts')
      do_week[day_of_first].unshift('PyRnt')
      if start_of_quarters.include?(month) 
        do_week['Sun'].unshift('FrsCntctCs')
        do_week['Sun'].unshift('BgSv')
      end
    end
    do_week
  end 

  def self.month_end(do_week, days_this_week)
    index_of_26th = days_this_week.index(26)
    if index_of_26th 
      day_of_26th = Templates.do_day_names[index_of_26th]
      if day_of_26th == 'Sat' || day_of_26th == 'Sun' && index_of_26th != 6
        day_of_26th = 'Mon'
      elsif day_of_26th == 'Sat' || day_of_26th == 'Sun' && index_of_26th == 6
        day_of_26th = 'Fri'
      end
      do_week[day_of_26th].unshift('ByTrnTk')
    end
    do_week
  end 

  # def self.check_birthdays(month, days_this_week)
  #   {
  #     dad = 
  #     birthdays = [
  #       { name: 'Dad', month: 9, day: 29 },
  #       { name: 'Mom', month: 8, day: 26 },
  #       { name: 'Kevin', month: 8, day: 15 },
  #       { name: 'Lori', month: 8, day: 9 },
  #       { name: 'Brian', month: 10, day: 10 },
  #       { name: 'Nate', month: 8, day: 19 },
  #       { name: 'Grant', month: 11, day: 28 }
  #     ]
  #   }

  #   birthdays.each do | birthday |
  #     if (birthday.month == month && days_this_week.include?(birthday.day)

  #     end
  #   end

  # end 
end

