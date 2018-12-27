module Birthdays

  def self.add_all(do_year)
    do_year.weeks.each do |week|
      week.days.each do |day|
        # Dad
        if day.month == 9 && day.month_day == 29
          day.tasks.unshift("[Dad's Birthday]")
        # Mom
        elsif day.month == 8 && day.month_day == 26
          day.tasks.unshift("[Mom's Birthday]")
        # Kevin
        elsif day.month == 8 && day.month_day == 15
          day.tasks.unshift("[Kevin's Birthday]")
        # Lori 
        elsif day.month == 8 && day.month_day == 9
          day.tasks.unshift("[Lori's Birthday]")
        # Brian
        elsif day.month == 10 && day.month_day == 10
          day.tasks.unshift("[Brian's Birthday]")
        # Eric
        elsif day.month == 2 && day.month_day == 13
          day.tasks.unshift("[Eric's Birthday]")
        # Nate 
        elsif day.month == 8 && day.month_day == 19
          day.tasks.unshift("[Nate's Birthday]")
        # Grant
        elsif day.month == 11 && day.month_day == 28
          day.tasks.unshift("[Grant's Birthday]")
        end
      end
    end
    do_year
  end

end

