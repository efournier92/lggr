module Lg
  def self.print(do_year)
    year = do_year.year
    out_file = File.new("./Out/#{ year }_LG.txt", "w")

    weekday_string = "***\n[S]\n***\n[R]\n"
    weekend_string = "***\n[R]\n"
    friday_string  = "***\n[S]\n***\n[S]\n***\n[R]\n"

    do_year.weeks.each do | week |
      week.days.each do | day |
          out_file.puts('************************')
          out_file.puts("#{ year }-#{ '%02d' % day.month }-#{ '%02d' % day.month_day }")
          out_file.puts('***********')
          out_file.puts("#{ day.name } - ")
          if day.name == 'Fri'
            out_file.puts(friday_string)
          elsif day.name == 'Sat' || day.name == 'Sun'
            out_file.puts(weekend_string)
          else
            out_file.puts(weekday_string)
          end
      end
    end




  end
end


#     until month == 13 do
#       day_string  = ""
#       day_string += "************************\n"
#       day_string += "#{ year }-#{ '%02d' % month }-#{ '%02d' % day }\n"
#       day_string += "*********\n#{ days[day_index] } - \n"

#       if day_index == 1 || day_index == 2
#         day_string += weekend_string
#       elsif days[day_index] == 'Fri'
#         day_string += friday_string 
#       else
#         day_string += weekday_string 
#       end

#       if day >= days_in_month[month - 1]
#         day = 0
#         month += 1
#       end

#       if day_index == 6
#         day_index = 0
#       else
#         day_index += 1
#       end

#       day += 1
#       year_arr.push(day_string)
#     end

#     year_arr.reverse_each do | day |
#       out_file.print(day)
#     end
#     out_file.close
#   end
# end

