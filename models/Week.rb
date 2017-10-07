class Week
  attr_reader   :month, :days
  attr_accessor :index, :days_this_week

  def initialize(index, days_this_week, year, month)
    @index = index
    @month = month
    @days_this_week = days_this_week
    @days = Week.build(days_this_week, year, month)
  end

  def self.build(days_this_week, year, month)
    week_arr = []
    last_day = 0
    Week.days.each_with_index do | (day_name,day_tasks), index |
      month_day = days_this_week[index]
      if last_day > month_day 
        if month == 0
          month += 1
          year += 1
        elsif month == 13
          month = 1
          year -= 1
        end
      end
      day = Day.new(day_name, day_tasks, year, month, month_day)
      week_arr.push(day)
      last_day = month_day 
    end
    week_arr
  end

  def self.days
    { 'Mon' => ['Gt', 'Af_Rcv(1900)'],
      'Tue' => ['Gt'],
      'Wed' => ['Gt'],
      'Thu' => ['Gt'],
      'Fri' => ['Gt', 'aLg', 'Lg', 'FnLg[R]s', 'LgWk', 'Bgt', 'PyCC'],
      'Sat' => ['Gt', 'Af_Ord()'],
      'Sun' => ['Gt', 'Amz()', 'ClnMbDsktp', 'TM', 'Ln', 'ClHm(1300, )', 
                'Vac()', 'ClnKtch', 'ClnFrdg', 'Sv', 'Plk', 'Ns', 'Ap']
    }
  end

  def self.days_this_week(day, month, days_in_months)
    day_array = []
    days_in_month = days_in_months[month - 1]
    7.times do
      if day > days_in_month
        day = 1
      end
      day_array.push(day)
      day += 1
    end
    day_array
  end

end

