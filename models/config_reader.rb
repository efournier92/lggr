require 'yaml'
require './models/task_printer'

class ConfigReader
  CONFIG_KEYS = {
    TASKS: 'tasks',
    DAYS: 'days'
  }

  def initialize(config_file_path)
    @config = read_file(config_file_path)
  end

  def read_file(file_path)
    begin
      config = YAML.load_file(file_path)
    rescue
      config = {}
    end

    config
  end

  def get_configured_days()
    @config[CONFIG_KEYS[:DAYS]]
  end

  def get_tasks_by_day_name(day_name)
    begin
      days = get_configured_days()
      day = days[day_name] || []
    rescue
      day = []
    end

    day
  end

  def get_tasks_by_name(task_name)
    @config[CONFIG_KEYS[:TASKS]][task_name]
  end

  def print_tasks_by_day_name(day_name)
    output = ''
    printer = TaskPrinter.new()

    day_tasks = get_tasks_by_day_name(day_name)

    day_tasks.each do |task|
      tasks = get_tasks_by_name(task)
      output = printer.print(tasks)
    end

    output
  end
end
