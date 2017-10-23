class Month

  def self.add_start_tasks(do_year)
    for month in 1..12
      # 20th of month
      do_year = Add_Tag.to_specific_date(do_year, month, 21, 'Intrnt_Py')
      # 28th of month
      do_year = Add_Tag.to_specific_date(do_year, month, 28, 
                               'TrnTk_By, Rnt_Py')
      # last day of month
      do_year = Add_Tag.to_last_day_of_month(do_year, month, 
                                             'RntPrepChk')
      # first day of month
      do_year = Add_Tag.to_specific_date(do_year, month, 1, 
                               'Rnt_Py, PyIntrnt')
      # first Saturday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 1, 'Sat', 
                                             'Scpts_Ord, Scpts_Rcv, Scpts_CtPls')
      # first Sunday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 1, 'Sun', 
                                  'FrshCntcts, FrshRzrs, NxBk')
      # quarterly tasks
      quarter_months = [1, 4, 7, 10]
      quarter_months.each do | quarter_month |
        if (month == quarter_month)
          # first Sunday of quarter
          do_year = Add_Tag.to_nth_xday_in_month(do_year, quarter_month, 1, 'Sun', 
                                      'FrsCntctCs, BgSv, TM_B')
        end
      end
    end 
    do_year
  end

end

