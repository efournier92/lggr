module Birthdays

  def self.add_all(do_year)
    do_year.weeks.each do |week|
      week.days.each do |day|
        # Dad
        if day.month == 9 && day.month_day == 29
          day.tasks.unshift('[Bday_Dd]')
        # Mom
        elsif day.month == 8 && day.month_day == 26
          day.tasks.unshift('[Bday_Mm]')
        # Kevin
        elsif day.month == 8 && day.month_day == 15
          day.tasks.unshift('[Bday_Kevin]')
        # Lori 
        elsif day.month == 8 && day.month_day == 9
          day.tasks.unshift('[Bday_Lori]')
        # Brian
        elsif day.month == 10 && day.month_day == 10
          day.tasks.unshift('[Bday_Brian]')
        # Eric
        elsif day.month == 2 && day.month_day == 13
          day.tasks.unshift('[Bday_Eric]')
        # Nate 
        elsif day.month == 8 && day.month_day == 19
          day.tasks.unshift('[Bday_Nate]')
        # Grant
        elsif day.month == 11 && day.month_day == 28
          day.tasks.unshift('[Bday_Grant]')
        end
      end
    end
    do_year
  end

end

