class Month
  def self.add_start_tasks(do_year)
    for month in 1..12
      # 10th of month
      do_year = Add_Tag.to_specific_date(do_year, month, 10, 
                                         'Bills_Pay(Internet,)')
      # 16th of month
      do_year = Add_Tag.to_specific_date(do_year, month, 16, 
                                         'Bills_Pay(Electric,)')
      # first day of month
      do_year = Add_Tag.to_specific_date(do_year, month, 1, 
                               'Bill_Rent(Check_Write, Pay,), Log_Do_NextMonth')
      # first Sunday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 1, 'Sunday', 
                                             'Contacts_New(Case, Lenses,), Razors_New, ToothBrush_Head_New, Bk(Nx, gry-blk, gry-extA, sda3-bkA, bkA-bkB, bnk-bnkA, extA-extB,), BatteryExtender_Charge')
      # third Saturday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 3, 'Saturday', 
                                             'Hair_Cut()')
      # fourth Sunday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 4, 'Sunday', 
                                             'Laundry(Laundromat, Fold), Rx(Order, Rcv, Pills_Cut,)')
      # every third Sunday
      do_year = Add_Tag.to_xday_every_n_weeks(do_year, month, 2, 'Sunday', 'FournierDesktop_Reactivate(Windows, Office,)')

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

