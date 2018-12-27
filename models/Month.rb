class Month

  def self.add_start_tasks(do_year)
    for month in 1..12
      # 10th of month
      do_year = Add_Tag.to_specific_date(do_year, month, 10, 
                                         'Bill_Internet_Pay')
      # 16th of month
      do_year = Add_Tag.to_specific_date(do_year, month, 16, 
                                         'Bill_Electric_Pay')
      # 28th of month
      do_year = Add_Tag.to_specific_date(do_year, month, 28, 
                               'TrainTicket_Buy')
      # first day of month
      do_year = Add_Tag.to_specific_date(do_year, month, 1, 
                               'Rent_Pay, Lg_Do_NextMonth')
      # first Sunday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 1, 'Sunday', 
                                  'Contacts_New, ToothBrush_Head_New, Razors_New, Nx_Bk, Bk(bkA(Lnx, Osx, Win), bkA-bkB, gry-blk)')
      # second Sunday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 2, 'Sunday', 
                                             'Rx_Ord, Ln_drmt, Rx_Rcv, Ln_Fld, Rx_Pills_Cut')
      # third Saturday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 3, 'Saturday', 
                                             'Hair_Cut()')
      # quarterly tasks
      quarter_months = [1, 4, 7, 10]
      quarter_months.each do | quarter_month |
        if (month == quarter_month)
          # first Sunday of quarter
          do_year = Add_Tag.to_nth_xday_in_month(do_year, quarter_month, 1, 'Sunday', 
                                                 'Contacts_Case_New, Sv_All')
        end
      end
    end 
    do_year
  end

end

