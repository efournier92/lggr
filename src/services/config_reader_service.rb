require 'yaml'
require './src/services/task_printer_service'
require './src/constants/config_constants'

class ConfigReaderService

  def initialize(config_file)
    @config = read_file(config_file)
  end

  def read_file(config_file)
    YAML.load_file(config_file)
  end

  def get_configured_days()
    @config[CONFIG_KEYS[:DAYS]]
  end

  def get_configured_templates()
    @config[CONFIG_KEYS[:TEMPLATES]]
  end

  def get_configured_special_tags()
    @config[CONFIG_KEYS[:SPECIAL]]
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
    printer = TaskPrinterService.new()

    day_tasks = get_tasks_by_day_name(day_name)

    day_tasks.each do |task|
      tasks = get_tasks_by_name(task)
      output = printer.print(tasks)
    end

    output
  end
end
