require './src/services/file_parser_service'
require './test/constants/test_constants'

def create_log_file(config_file, print_type, print_year, print_month)
  `ruby run.rb '#{config_file}' '#{print_type}' '#{print_year}' '#{print_month}'`
end

context 'User sketches a full-year log file' do
  before :all do
    @out_directory = './_out'
    file_name = "#{@out_directory}/DO_2020.md"
    @file_path = Pathname.new(file_name)

    create_log_file(TestConstants::CONFIG_FILES[:TEST_PATH], 'DO', 2020, 'ALL')

    file_contents = IO.read(@file_path)

    file_parser = FileParser.new
    @do_hash = file_parser.get_date_hash_from_do_file(file_contents)
  end

  after :all do
    # `rm -rf #{@out_directory}`
  end

  context 'when creating a whole year' do
    it 'creates the log file' do
      expect(@file_path).to exist
    end

    it 'adds dates to the log file' do
      expect(@do_hash['2020-01-01']).to_not be(nil)
    end
  end

  context 'given we configure periodic special tasks for a whole year' do
    it 'adds a configured tasks to a specific date' do
      date = '2020-01-01'
      expect(@do_hash[date]).to include('First_Day')
    end

    it 'adds a configured tasks to the Nth Xday in a specific month' do
      date = '2020-01-14'
      expect(@do_hash[date]).to include('Nth_Day')
    end

    it 'adds a configured tasks to the Nth Xday in each month' do
      date = '2020-01-01'
      expect(@do_hash[date]).to include('First_Day')
    end

    it 'adds a configured tasks to the last Xday in a specific month' do
      date = '2020-01-01'
      expect(@do_hash[date]).to include('First_Day')
    end

    it 'adds a configured tasks to the last Xday in each month' do
      date = '2020-01-01'
      expect(@do_hash[date]).to include('First_Day')
    end

    it 'adds a configured tasks to the last day in each month' do
      date = '2020-01-01'
      expect(@do_hash[date]).to include('First_Day')
    end

    it 'adds a configured tasks to the nth day in a specific month' do
      date = '2020-01-01'
      expect(@do_hash[date]).to include('First_Day')
    end

    it 'adds a configured tasks to the nth day in a specific month' do
      date = '2020-01-01'
      expect(@do_hash[date]).to include('First_Day')
    end

    it 'adds Easter' do
      date = '2020-01-01'
      expect(@do_hash[date]).to include('First_Day')
    end

    it 'adds Good Friday' do
      date = '2020-01-01'
      expect(@do_hash[date]).to include('First_Day')
    end
  end
end

# example 'with all valid query params' do

# end

# after :each do
#     `rm -rf #{@out_directory}`
# end

# example 'without any query params' do

# end

# example 'with only a config query param' do

# end

# example 'with an invalid year query param formatted as a string' do

# end

# example 'with a valid year query param formatted as a string' do

# end

# example 'without a month query param' do

# end

# end
