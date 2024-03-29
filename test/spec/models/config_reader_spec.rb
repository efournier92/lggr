require './src/services/config_reader_service'
require './src/constants/config_constants'
require './test/constants/test_constants'

describe ConfigReaderService do
  before :each do
    @config_reader = ConfigReaderService.new(TestConstants::CONFIG_FILES[:TEST_PATH])
    @config = @config_reader.read_file(TestConstants::CONFIG_FILES[:TEST_PATH])
  end

  describe '#read_file' do
    context 'given an actual file to read' do
      it 'returns a config based on the file' do
        expect(@config).to be_a(Hash)
      end
    end

    context 'given an nonexistent file to read' do
      it 'throws an error' do
        expect do
          @config_reader.read_file(TestConstants::CONFIG_FILES[:FAKE_PATH])
        end.to raise_error
      end
    end

    context 'given an internal node to read' do
      it 'returns a hash' do
        tasks = @config[ConfigConstants::KEYS[:TASKS]]
        node_name = TestConstants::KEYS[:DIMENTIONAL_2]

        node = tasks[node_name]

        expect(node).to be_an_instance_of(Hash)
      end
    end

    context 'given a leaf node to read' do
      it 'returns an array' do
        tasks = @config[ConfigConstants::KEYS[:TASKS]]
        node_name = TestConstants::KEYS[:DIMENTIONAL_1]

        node = tasks[node_name]

        expect(node).to be_an_instance_of(Array)
      end
    end
  end

  describe '#get_days' do
    context 'given a valid config' do
      it 'returns a hash with the configured days' do
        days = @config_reader.get_configured_days

        expect(days).to be_an_instance_of(Hash)
        expect(days.empty?).to be false
      end
    end
  end

  describe '#get_special_tags' do
    context 'given a valid config' do
      it 'returns a hash with configured special tags' do
        tags = @config_reader.get_configured_special_tags
        first_day = tags[TestConstants::HOLIDAYS[:FIRST_DAY]]

        expect(tags).to be_an_instance_of(Hash)
        expect(first_day[ConfigConstants::KEYS[:TEMPLATE]]).to eql(ConfigConstants::TEMPLATE_TYPES[:HOLIDAY])
        expect(first_day[ConfigConstants::KEYS[:METHOD]]).to eql(ConfigConstants::SPECIAL_METHODS[:SPECIFIC_DATE])
      end
    end
  end

  describe '#get_tasks_by_day_name' do
    context 'given a call to get Monday' do
      it 'returns an array of task keys configured for Monday' do
        day_name = 'Monday'
        days = @config_reader.get_tasks_by_day_name(day_name)

        expect(days).to include(TestConstants::KEYS[:DIMENTIONAL_1])
      end
    end

    context 'given a config without the supplied day' do
      before :each do
        @config_reader = ConfigReaderService.new(TestConstants::CONFIG_FILES[:TEST_PATH])
      end

      it 'returns an empty array' do
        day_name = 'Blursday'
        days = @config_reader.get_tasks_by_day_name(day_name)

        expect(days).to be_an_instance_of(Array)
        expect(days.empty?).to be true
      end
    end

    context 'given a real configured and an unconfigured day' do
      before :each do
        @config_reader = ConfigReaderService.new(TestConstants::CONFIG_FILES[:TEST_PATH])
      end

      it 'returns an empty array' do
        day_name = 'Fakeday'
        days = @config_reader.get_tasks_by_day_name(day_name)

        expect(days).to be_an_instance_of(Array)
        expect(days.empty?).to be true
      end
    end
  end

  describe '#print_tasks_by_day_name' do
    before :each do
      @config_reader = ConfigReaderService.new(TestConstants::CONFIG_FILES[:TEST_PATH])
    end

    context 'given a call to print a day with a single configured task' do
      it 'returns prints a single task as a string' do
        day_name = 'Monday'
        tasks = @config_reader.print_tasks_by_day_name(day_name)

        expect(tasks).to eql("Level_1,\n")
      end
    end

    context 'given a call to print a day with multiple configured task' do
      it 'returns prints multiple as a string' do
        day_name = 'Tuesday'
        tasks = @config_reader.print_tasks_by_day_name(day_name)

        expect(tasks).to eql("Level_1,\nLevel_1,\n")
      end
    end

    context 'given an unconfigured day' do
      it 'returns an empty string' do
        day_name = 'Fakeday'
        tasks = @config_reader.print_tasks_by_day_name(day_name)

        expect(tasks).to eql('')
      end
    end
  end
end
