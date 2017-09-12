class Day
  attr_reader :tasks, :month, :month_day

  def initialize(tasks, month, month_day)
    @tasks = tasks
    @month = month
    @month_day = month_day
  end
end
