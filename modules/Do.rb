module Do
  def self.print(days_in_month, year, month)
    out_file = File.new("./Out/#{ year }_DO.txt", "w")
    day = Cal_Tools.get_first_monday(year)

    do_year = []
    week_index = 0

    binding.pry

      # out_file.puts('************************')
      # out_file.puts("#{ year }-#{ '%02d' % month }-#{ '%02d' % day }")
      # out_file.puts('************************')

      # do_week.each do |day, tasks|
      #   out_file.print(
      #     day + ' - '
      #   )

      #   tasks.each do |task|
      #     out_file.print (
      #       task + ', '
      #     )
      #   end
      #   out_file.print("\n")
      # end

      # day += 7
      # if day > days_in_month[month - 1]
      #   day = day - days_in_month[month - 1]
      #   month += 1
      # end
      # first_day_of_month = nil
      # week_index += 1
    # end

    out_file.puts("************************\n\n")
    out_file.close
  end
end

