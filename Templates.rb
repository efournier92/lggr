module Templates
  def self.do_week
    {
      'Mon' => ['Gt', 'Ln'],
      'Tue' => ['Gt', 'Ln'],
      'Wed' => ['Gt', 'Ln'],
      'Thu' => ['Gt', 'GS()', 'Ln'],
      'Fri' => ['Gt', 'Lg', 'aLg', 'LgWk', 'Bgt', 'PyCC'],
      'Sat' => ['Gt'],
      'Sun' => ['Gt', 'Amz()', 'ClHm()', 'ClnKtch', 'ClnFrdg', 'Vac()', 'Sv', 'Ns', 'AF(00)', 'TM', 'Ln', 'Ap']
    }
  end

  def self.do_week_odd_sunday
    ['Gt', 'Amz()', 'ClHm()', 'DoLn()', 'FldLn', 'ClnKtch', 'ClnFrdg', 'Sv', 'Ns', 'AF(00)', 'TM', 'Ln', 'Ap']
  end
end
