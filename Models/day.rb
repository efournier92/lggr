class Day
  attr_reader :tasks, :month, :month_day

  def initialize(name, tasks, month, month_day)
    @name = name
    @tasks = tasks
    @month = month
    @month_day = month_day
  end
end
