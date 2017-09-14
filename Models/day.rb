class Day
  attr_accessor :tasks
  attr_reader :month, :month_day

  def initialize(name, tasks, month, month_day)
    @name = name
    @tasks = tasks
    @month = month
    @month_day = month_day
  end
end
