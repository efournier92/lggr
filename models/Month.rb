class Month
  def self.add_to_nth_day_in_month(do_year, month, nth_day, day_name, holiday_name)
    day_count = 0
    do_year.weeks.each do | week |
      week.days.each do | day |
        if day.month == month && day.name == day_name 
          day_count += 1
          if day_count == nth_day
            day.tasks.unshift(holiday_name)
          end
        end
      end
    end
    do_year
  end

  def self.add_month_start_tasks(do_week, week_index, days_this_week, month)
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

  def self.check_birthdays(month, days_this_week)
    {
      dad = 
      birthdays = [
        { name: 'Dad', month: 9, day: 29 },
        { name: 'Mom', month: 8, day: 26 },
        { name: 'Kevin', month: 8, day: 15 },
        { name: 'Lori', month: 8, day: 9 },
        { name: 'Brian', month: 10, day: 10 },
        { name: 'Nate', month: 8, day: 19 },
        { name: 'Grant', month: 11, day: 28 }
      ]
    }

    birthdays.each do | birthday |
      if (birthday.month == month && days_this_week.include?(birthday.day)

      end
    end

  end 

end

