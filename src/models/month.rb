require './src/services/add_tag_service'

class Month
  def self.add_start_tasks(do_year)
    add_tag_service = AddTagService.new

    task = Task.new
    (1..12).each do |month|
      # 1st day of month
      # do_year = add_tag_service.to_specific_date(do_year, month, 1, task.bill_rent_pay)
      # do_year = add_tag_service.to_specific_date(do_year, month, 1, task.lg_do_next_month)

      # 3rd Friday of month
      # do_year = add_tag_service.to_nth_xday_in_month(do_year, month, 3, 'Friday', task.bill_utilities_pay)

      # first Sunday of month
      # do_year = add_tag_service.to_nth_xday_in_month(do_year, month, 1, 'Sunday', task.first_of_month)

      # third Saturday of month
      do_year = add_tag_service.to_nth_xday_in_month(do_year, month, 3, 'Saturday', task.hair_cut)

      # quarterly tasks
      quarter_months = [1, 4, 7, 10]
      quarter_months.each do |quarter_month|
        next unless month == quarter_month

        # first Sunday of quarter
        # do_year = add_tag_service.to_nth_xday_in_month(do_year, quarter_month, 1, "Sunday", task.groom_shave_all)
        # first Saturday of the quarter
        do_year = add_tag_service.to_nth_xday_in_month(do_year, quarter_month, 1, 'Saturday', task.guitar_restring)
      end
    end
    do_year
  end
end
