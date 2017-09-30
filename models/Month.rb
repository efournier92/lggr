class Month

  def self.days_in_months
    [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
  end

  def self.to_last_day_of_month(do_year, month)
    last_day_of_month = Month.days_in_months[month - 1]
  end

  def self.add_start_tasks(do_year, week_index, days_this_week, month)
    for (month = 1; month <= 12; month += 1) 
      Add_Tag.to_specific_date(do_year.year, month, 1, 
                               'ByTrnTk, PyIntrnt, PyRnt, RcvScrpts, ')
      Add_Tag.to_nth_day_in_month(do_year.year, month, 1, 'Sat', 
                                  'Scpts_Ord, Scpts_Rcv, Scpts_CtPls, ')
      Add_Tag.to_nth_day_in_month(do_year.year, month, 1, 'Sun', 
                                  'NxBk, FrsRzrs, FrshCntcts, ')
      quarter_months = [1, 4, 7, 10]
      quarter_months.each do |quarter_month|
        if (month == quarter_month)
          Add_Tag.to_nth_day_in_month(do_year.year, i, 1, 'Sun', 
                                      'FrsCntctCs, BgSv, TB_B, ')
        end
      end
    end 

  end

