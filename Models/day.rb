class Day
  attr_accessor :tasks
  attr_reader :month, :month_day, :name

  def initialize(name, tasks, month, month_day)
    @name = name
    @tasks = tasks
    @month = month
    @month_day = month_day
  end

  def self.odd_sunday_tasks
      ['Gt', 'Amz()', 'ClnMbDsktp', 'TM', 'Ln', 'ClHm(1300, )', 'Lndrmt(all)', 'FldLn', 'ClnKtch', 'ClnFrdg', 'Sv', 'Plk', 'Ns', 'Ap']
  end

end
