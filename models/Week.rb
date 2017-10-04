class Week
  attr_accessor :week_index, :days_this_week

  def initialize(week_index, days_this_week, month)
    @week_index = week_index
    @days_this_week = days_this_week
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

  def self.build(month, days_this_week)
    week_arr = []
    Week.days.each_with_index do | day_name, day_tasks |
      day = Day.new(day_name, day_tasks, month, days_this_week[index])
      week_arr.push(day)
    end
    week_arr
  end

end

