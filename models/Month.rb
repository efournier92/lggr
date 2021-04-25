class Month
  def self.add_start_tasks(do_year)
    task = Task.new
    for month in 1..12
      # 1st day of month
      do_year = Add_Tag.to_specific_date(do_year, month, 1, task.bill_rent_pay)
      do_year = Add_Tag.to_specific_date(do_year, month, 1, task.lg_do_next_month)
      # 16th day of the month
      do_year = Add_Tag.to_specific_date(do_year, month, 16, task.bills_pay_electric_internet)

      # first Sunday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 1, "Sunday", task.first_of_month)

      # third Saturday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 3, "Saturday", task.hair_cut)

      # fourth Sunday of month
      do_year = Add_Tag.to_nth_xday_in_month(do_year, month, 4, "Sunday", task.rx)

      # quarterly tasks
      quarter_months = [1, 4, 7, 10]
      quarter_months.each do | quarter_month |
        if (month == quarter_month)
          # first Sunday of quarter
          do_year = Add_Tag.to_nth_xday_in_month(do_year, quarter_month, 1, "Sunday", task.groom_shave_all)
        end
      end
    end 
    do_year
  end
end

