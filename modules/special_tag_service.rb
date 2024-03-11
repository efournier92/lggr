require './models/config_reader'
require './models/task_printer'
require './models/Year'
require './modules/Add_Tag'
require './constants/config_constants'

class SpecialTagService

  def add_special_tags(year)
    config_file = year.config_file
    reader = ConfigReader.new(config_file)
    tags = reader.get_configured_special_tags()

    tags.each do |name, config|
      printer = TaskPrinter.new()
      method = config[CONFIG_KEYS[:METHOD]]
      template = reader.get_configured_templates[config[CONFIG_KEYS[:TEMPLATE]]]
      config[CONFIG_KEYS[:TAG]] = printer.print_from_template(template, config[CONFIG_KEYS[:CONTENT]])
      Add_Tag.public_send(method, year, config)
    end
  end

end
