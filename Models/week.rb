class Week
  attr_accessor :week_index, :days_this_week

  def initialize(week_index, days_this_week)
    @week_index = week_index
    @days_this_week = days_this_week
    mon = Day.new('Mon', ['Gt', 'Af_Rcv(1900)'], month, days_this_week[0])
    tue = Day.new('Tue', ['Gt'], month, days_this_week[1])
    wed = Day.new('Wed', ['Gt'], month, days_this_week[2])
    thu = Day.new('Thu', ['Gt'], month, days_this_week[3])
    fri = Day.new('Fri', 
                 ['Gt', 'aLg', 'Lg', 'FnLg[R]s', 'LgWk', 'Bgt', 'PyCC'],
                 month, days_this_week[4])
    sat = Day.new('Sat', ['Gt', 'Af_Ord()'], month, days_this_week[5])
    sun = Day.new('Sun', 
                  ['Gt', 'Amz()', 'ClnMbDsktp', 'TM', 'Ln', 'ClHm(1300, )', 
                   'Vac()', 'ClnKtch', 'ClnFrdg', 'Sv', 'Plk', 'Ns', 'Ap'],
                  month, days_this_week[6])
    @days = [mon, tue, wed, thu, fri, sat, sun]
  end

  def self.days_this_week(day, month)
    day_array = []
    days_in_month = Templates.days_in_months[month-1]
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

