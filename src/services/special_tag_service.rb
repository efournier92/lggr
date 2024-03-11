require './src/services/config_reader_service'
require './src/services/task_printer_service'
require './src/models/year'
require './src/services/add_tag_service'
require './src/constants/config_constants'

class SpecialTagService

  def add_special_tags(year)
    config_file = year.config_file
    reader = ConfigReaderService.new(config_file)
    add_tag_service = AddTagService.new()
    tags = reader.get_configured_special_tags()

    tags.each do |name, config|
      printer = TaskPrinterService.new()
      method = config[ConfigConstants::KEYS[:METHOD]]
      template = reader.get_configured_templates[config[ConfigConstants::KEYS[:TEMPLATE]]]
      config[ConfigConstants::KEYS[:TAG]] = printer.print_from_template(template, config[ConfigConstants::KEYS[:CONTENT]])
      add_tag_service.public_send(method, year, config)
    end
  end

end
