class Week
  attr_accessor :week_index, :days_this_week, :days

  def initialize(week_index, days_this_week, month)
    @week_index = week_index
    @days_this_week = days_this_week
    @days = Week.template(month, days_this_week)
  end

  def self.template(month, days_this_week)
    mon = Day.new('Mon', ['Gt', 'Af_Rcv(1900)'], month, days_this_week[0])
    month += 1 if days_this_week[0] > days_this_week[1]
    tue = Day.new('Tue', ['Gt'], month, days_this_week[1])
    month += 1 if days_this_week[1] > days_this_week[2]
    wed = Day.new('Wed', ['Gt'], month, days_this_week[2])
    month += 1 if days_this_week[2] > days_this_week[3]
    thu = Day.new('Thu', ['Gt'], month, days_this_week[3])
    month += 1 if days_this_week[3] > days_this_week[4]
    fri = Day.new('Fri', 
                 ['Gt', 'aLg', 'Lg', 'FnLg[R]s', 'LgWk', 'Bgt', 'PyCC'],
                 month, days_this_week[4])
    month += 1 if days_this_week[4] > days_this_week[5]
    sat = Day.new('Sat', ['Gt', 'Af_Ord()'], month, days_this_week[5])
    month += 1 if days_this_week[5] > days_this_week[6]
    sun = Day.new('Sun', 
                  ['Gt', 'Amz()', 'ClnMbDsktp', 'TM', 'Ln', 'ClHm(1300, )', 
                   'Vac()', 'ClnKtch', 'ClnFrdg', 'Sv', 'Plk', 'Ns', 'Ap'],
                  month, days_this_week[6])
    [mon, tue, wed, thu, fri, sat, sun]
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

