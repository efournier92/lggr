require './models/config_reader'

describe ConfigReader do
  TEST_CONFIG_PATH = './spec/test_config.yml'
  CONFIG_KEYS = {
    TASKS: 'tasks',
    DIMENTIONAL_1: '1_Dimentional',
    DIMENTIONAL_2: '2_Dimentional',
    DIMENTIONAL_3: '3_Dimentional',
  }

  before :each do
    @config_reader = ConfigReader.new()
  end

  describe '#read' do
    context 'given an actual file to read' do
      it 'returns a config based on the file' do
        config = @config_reader.read(TEST_CONFIG_PATH)

        expect(config).to be_a(Hash)
      end
    end

    context 'given an nonexistent file to read' do
      it 'returns an empty hash' do
        config = @config_reader.read('./spec/missing_config.yml')

        expect(config).to eql({})
      end
    end

    context 'given an internal node to read' do
      it 'returns a hash' do
        config = @config_reader.read(TEST_CONFIG_PATH)
        tasks = config[CONFIG_KEYS[:TASKS]]
        node_name = CONFIG_KEYS[:DIMENTIONAL_2]

        node = tasks[node_name]

        expect(node).to be_an_instance_of(Hash)
      end
    end

    context 'given a leaf node to read' do
      it 'returns an array' do
        config = @config_reader.read(TEST_CONFIG_PATH)
        tasks = config[CONFIG_KEYS[:TASKS]]
        node_name = CONFIG_KEYS[:DIMENTIONAL_1]

        node = tasks[node_name]

        expect(node).to be_an_instance_of(Array)
      end
    end
  end
end
