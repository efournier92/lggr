class Month
  def self.add_start_tasks(do_year)
    for month in 1..12
      # 16th of month
      do_year = Add_Tag.to_specific_date(do_year, month, 16, 
                                         "Bills_Pay(\n  Internet,\n  Electric,\n)")
      # first day of month
      do_year = Add_Tag.to_specific_date(do_year, month, 1, 
                               "Bill_Rent_Pay,\nLog_Do_NextMonth")
      # first Sunday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 1, "Sunday", 
                                             "Contacts_New(Case, Lenses,),\nRazors_New,\nToothBrush_Head_New,\nBk(\n  Phone,\n  sda3-bkA,\n  bkA-bkB,\n  bnk-bnkA,\n  extA-extB,\n),\nBatteryExtender_Charge")
      # third Saturday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 3, "Saturday", 
                                             "Hair_Cut()")
      # fourth Sunday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 4, "Sunday", 
                                             "Laundry(Laundromat, Fold), Rx(Order, Rcv, Pills_Cut,)")

      # quarterly tasks
      quarter_months = [1, 4, 7, 10]
      quarter_months.each do | quarter_month |
        if (month == quarter_month)
          # first Sunday of quarter
          do_year = Add_Tag.to_nth_xday_in_month(do_year, quarter_month, 1, "Sunday", "Sv_All")
        end
      end
    end 
    do_year
  end
end

