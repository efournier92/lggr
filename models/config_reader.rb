require 'yaml'

class ConfigReader

  def read(file_path)
    begin
      config = YAML.load_file(file_path)
    rescue
      config = {}
    end
    return config
  end

end
