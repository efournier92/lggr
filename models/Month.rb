class Month

  def self.add_start_tasks(do_year)
    for month in 1..12
      # 10th of month
      do_year = Add_Tag.to_specific_date(do_year, month, 10, 
                                         'Intrnt_Py')
      # 16th of month
      do_year = Add_Tag.to_specific_date(do_year, month, 16, 
                                         'Elctrc_Py')
      # 28th of month
      do_year = Add_Tag.to_specific_date(do_year, month, 28, 
                               'TrnTk_By')
      # last day of month
      do_year = Add_Tag.to_last_day_of_month(do_year, month, 
                                             'Rnt_Chk_Pk')
      # first day of month
      do_year = Add_Tag.to_specific_date(do_year, month, 1, 
                               'Rnt_Py, Orbt_NwLst, Lg_DoLst_NxtMnth')
      # first Saturday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 1, 'Saturday', 
                                             'Scpts_Ord, Scpts_Rcv, Scpts_CtPls')
      # third Saturday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 3, 'Saturday', 
                                             'Hr_Ct()')
      # first Sunday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 1, 'Sunday', 
                                  'FrshCntcts, FrshRzrs, NxBk')
      # quarterly tasks
      quarter_months = [1, 4, 7, 10]
      quarter_months.each do | quarter_month |
        if (month == quarter_month)
          # first Sunday of quarter
          do_year = Add_Tag.to_nth_xday_in_month(do_year, quarter_month, 1, 'Sunday', 
                                      'FrsCntctCs, BgSv, TM_B')
        end
      end
    end 
    do_year
  end

end

