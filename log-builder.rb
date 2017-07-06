out_file = File.new("logYear.txt", "w")

print "What Yeat?\n>> "
year = gets.chomp

# 52.times do

#   date = "#{ year }-01-#{ '%02d' % day }-#{ year }"

#   out_file.puts(
#     %{
#       *******************
#       #{ date }
#       *******************
#       Mon - Gt, Ln, 
#       Tues - Gt, Ln, 
#       Wed - Gt, Ln, 
#       Thu - Gt, GS(), Ln, 
#       Fri - Gt, LgWks, aLg, Lg, Bgt, PyCC, 
#       Sat - Gt, 
#       Sun - Gt, Amz(), ClHm(), ClnKtch, ClnFrdg, Vac(), Sv, Ns, AF(00), TM, Ln, Ap, 
#     }
#   )

#   day += 7

# end

# out_file.close

def getFirstSunday(year)
    years_since = year - 1
    leap_years = years_since / 4
    century_years = years_since / 100
    four_century_years = years_since / 400

    
    total_leap_years = leap_years - century_years + four_century_years
    total_precesion = years_since + total_leap_years
    day_index = total_precesion % 7
    
    first_sunday = 7 - day_index;
end

binding.pry

