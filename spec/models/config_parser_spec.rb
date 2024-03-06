require './models/config_parser'

describe ConfigParser do
  context "given a config file path" do
    it "returns a hash" do
      config_parser = ConfigParser.new()
      config = config_parser.read_file('./spec/sample_config.yml')

      expect(config).to be_an_instance_of(Hash)
      expect(config['tasks']['snippets']['excercise']).to eq('Excercise()')
    end

    it "" do
      config_parser = ConfigParser.new()
      config = config_parser.read_file('./spec/sample_config.yml')

      expect(config).to be_an_instance_of(Hash)
      expect(config['tasks']['snippets']['excercise']).to eq('Excercise()')
    end

  end
end
