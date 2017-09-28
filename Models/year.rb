class Year
  attr_accessor :weeks
  attr_reader :year

  def initialize(year)
    @year = year
    @weeks = []
    month = 1
    week_index = 1
    days_in_months = Year.days_in_months

    days_in_months[2] = 29 if self.leap_year?
    day = Cal_Tools.get_first_monday(year)

    52.times do
      days_this_week = Week.days_this_week(day, month)
      do_week = Week.new(week_index, days_this_week, month)

      if do_week.week_index.odd?
        do_week.days.find do |day|
          if day.name == 'Sun'
            day.tasks = Day.odd_sunday_tasks 
          end
        end
      end

      # do_week = Cal_Tools.month_end(do_week, do_week.days)
      # do_week = Cal_Tools.month_start(do_week, week_index, do_week.days, month)

      @weeks.push(do_week)
      day += 7
      if day > days_in_months[month - 1]
        day = day - days_in_months[month - 1]
        month += 1
      end
      first_day_of_month = nil
      week_index += 1
    end
  end

  def self.days_in_months
    [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
  end

  def leap_year?
    @year % 4 == 0 && !( @year % 100 == 0 && @year % 400 != 0 )
  end

  def self.add_holidays(do_year)
    Holidays.add_all(do_year)
  end

  def self.add_birthdays(do_year)
    do_year.weeks.each do |week|
      week.days.each do |day|
        if day.month == 9 && day.month_day == 29
          day.tasks.unshift("[Bday_Dd]")
        elsif day.month == 8 && day.month_day == 26
          day.tasks.unshift("[Bday_Mm]")
        elsif day.month == 8 && day.month_day == 15
          day.tasks.unshift("[Bday_Kevin]")
        elsif day.month == 8 && day.month_day == 9
          day.tasks.unshift("[Bday_Lori]")
        elsif day.month == 10 && day.month_day == 10
          day.tasks.unshift("[Bday_Brian]")
        elsif day.month == 2 && day.month_day == 13
          day.tasks.unshift("[Bday_Eric]")
        elsif day.month == 8 && day.month_day == 19
          day.tasks.unshift("[Bday_Nate]")
        elsif day.month == 11 && day.month_day == 28
          day.tasks.unshift("[Bday_Grant]")
        end
      end
    end
    do_year
  end
end

