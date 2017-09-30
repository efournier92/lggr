class Month

  def self.add_start_tasks(do_year, week_index, days_this_week, month)
    quarter_months = [1, 4, 7, 10]


    for (i = 1; i <= 12;i += 1) 
      do_week[day_of_first].unshift(
      # add to first day of month
      Add_Tag.to_specific_date(do_year.year, i, 1, 
                               'ByTrnTk, PyIntrnt, PyRnt, RcvScrpts, ')
      Add_Tag.to_nth_day_in_month(do_year.year, i, 1, 'Sat', 
                                  'Scpts_Ord, Scpts_Rcv, Scpts_CtPls, ')
      Add_Tag.to_nth_day_in_month(do_year.year, i, 1, 'Sun', 
                                  'NxBk, FrsRzrs, FrshCntcts, ')

      # add to first Saturday of month
      #
      # add to first Sunday of month
    end
    quarter_months.each do |month|
      Add_Tag.to_nth_day_in_month(do_year.year, i, 1, 'Sun', 'NxBk, FrsRzrs, FrshCntcts, ', 'FrsCntctCs, BgSv, ')

    do_year.weeks.each do | week |
      week.days.each do | day |
      # Add
      # add to first Saturday of month
      # add to first Sunday of month
      end
    end

    if first_index
      day_of_first = Templates.do_day_names[first_index]
      do_week['Sat'].unshift('CtPls')
      do_week[day_of_first].unshift('RcvScrpts')
      do_week[day_of_first].unshift('PyIntrnt')
      do_week[day_of_first].unshift('PyRnt')
      do_week['Sun'].unshift('NxBk')
      do_week['Sun'].unshift('FrsRzrs')
      do_week['Sun'].unshift('FrshCntcts')
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

