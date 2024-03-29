require './src/services/config_reader_service'
require './src/services/task_printer_service'
require './src/models/year'
require './src/services/add_tag_service'
require './src/constants/config_constants'

class SpecialTagService
  def add_special_tags(year)
    config_file = year.config_file
    reader = ConfigReaderService.new(config_file)
    add_tag_service = AddTagService.new
    tags = reader.configured_tasks

    return if tags.nil?

    tags.each_value do |config|
      printer = TaskPrinterService.new(config_file)
      method = config[ConfigConstants::KEYS[:METHOD]]
      template = reader.configured_task_templates[config[ConfigConstants::KEYS[:TEMPLATE]]]
      template_variables = config[ConfigConstants::KEYS[:TEMPLATE_VARIABLES]]

      template = config[ConfigConstants::KEYS[:TEMPLATE]] if template.nil?

      config[ConfigConstants::KEYS[:TAG]] =
        printer.print_from_template(template, template_variables)

      add_tag_service.public_send(method, year, config)
    end

    year
  end
end
