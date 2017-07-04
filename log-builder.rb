out_file = File.new("logYear.txt", "w")

print "1st Sunday in January?\n>> "
firstSunday = gets.chomp.to_i

print "What Yeat?\n>> "
year = gets.chomp

day = firstSunday

52.times do

  date = "#{ year }-01-#{ '%02d' % day }-#{ year }"

  out_file.puts(
    %{
      *******************
      #{ date }
      *******************
      Mon - Gt, Ln, 
      Tues - Gt, Ln, 
      Wed - Gt, Ln, 
      Thu - Gt, GS(), Ln, 
      Fri - Gt, LgWks, aLg, Lg, Bgt, PyCC, 
      Sat - Gt, 
      Sun - Gt, Amz(), ClHm(), ClnKtch, ClnFrdg, Vac(), Sv, Ns, AF(00), TM, Ln, Ap, 
    }
  )

  day += 7

end

out_file.close

