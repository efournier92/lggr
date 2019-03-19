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
                               'Bill_TrainTicket_Pay')
      # first day of month
      do_year = Add_Tag.to_specific_date(do_year, month, 1, 
                               'Bill_Rent_Pay, Lg_Do_NextMonth')
      # first Sunday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 1, 'Sunday', 
                                             'Contacts_New(Case, Lenses,), Razors_New, ToothBrush_Head_New, Bk(Nx, sda3-bkA, bkA-bkB, gry-blk,)')
      # third Saturday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 3, 'Saturday', 
                                             'Hair_Cut()')
      # third Sunday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 3, 'Sunday', 
                                             'Dd_FournierDesktop_ReActivate(Windows, Office,), Fish_Tank_Clean')
      # fourth Sunday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 4, 'Sunday', 
                                             'Rx_Ord, Ln_drmt, Rx_Rcv, Ln_Fld, Rx_Pills_Cut')
      # quarterly tasks
      quarter_months = [1, 4, 7, 10]
      quarter_months.each do | quarter_month |
        if (month == quarter_month)
          # first Sunday of quarter
          do_year = Add_Tag.to_nth_xday_in_month(do_year, quarter_month, 1, 'Sunday', 'Sv_All')
        end
      end
    end 
    do_year
  end
end
