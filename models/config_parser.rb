require 'yaml'
require 'pry'

class ConfigParser
  def read_file(file_path)
    config = YAML.load_file(file_path)
    binding.pry
  end
end
