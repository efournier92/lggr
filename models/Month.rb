class Month

  def self.add_start_tasks(do_year, week_index, days_this_week, month)
    for (month = 1; month <= 12; month += 1) 
      # last day of month
      do_year = Add_Tag.to_last_day_of_month(do_year, month, 
      # first day of month
      do_year = Add_Tag.to_specific_date(do_year, month, 1, 
                               'ByTrnTk, Rnt_Py, PyIntrnt, ')
      # first Saturday of month
      do_year = Add_Tag.to_nth_day_in_month(do_year, month, 1, 'Sat', 
                                  'Scpts_Ord, Scpts_Rcv, Scpts_CtPls, ')
      # first Sunday of month
      do_year = Add_Tag.to_nth_day_in_month(do_year, month, 1, 'Sun', 
                                  'FrshCntcts, FrshRzrs, NxBk')
      # quarterly tasks
      quarter_months = [1, 4, 7, 10]
      quarter_months.each do |quarter_month|
        if (month == quarter_month)
          # first Sunday of quarter
          do_year = Add_Tag.to_nth_day_in_month(do_year.year, i, 1, 'Sun', 
                                      'FrsCntctCs, BgSv, TB_B, ')
        end
      end
    end 
    do_year
  end

end

