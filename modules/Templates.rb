module Templates
  def self.days_in_months
    [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
  end

  def self.lg_day_names
    ['Fri', 'Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu']
  end

  def self.do_day_names
    ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
  end

  def self.do_week
    {
      'Mon' => ['Gt', 'Af_Rcv(1900)'],
      'Tue' => ['Gt'],
      'Wed' => ['Gt'],
      'Thu' => ['Gt'],
      'Fri' => ['Gt', 'aLg', 'Lg', 'FnLg[R]s', 'LgWk', 'Bgt', 'PyCC'],
      'Sat' => ['Gt', 'Af_Ord()'],
      'Sun' => ['Gt', 'Amz()', 'ClnMbDsktp', 'TM', 'Ln', 'ClHm(1300, )', 'Vac()', 'ClnKtch', 'ClnFrdg', 'Sv', 'Plk', 'Ns', 'Ap']
    }
  end

  def self.do_week_odd_sunday
      ['Gt', 'Amz()', 'ClnMbDsktp', 'TM', 'Ln', 'ClHm(1300, )', 'Lndrmt(all)', 'FldLn', 'ClnKtch', 'ClnFrdg', 'Sv', 'Plk', 'Ns', 'Ap']
  end
end

