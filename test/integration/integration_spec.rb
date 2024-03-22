require './src/services/file_parser_service'

def create_log_file(config_file, print_type, print_year, print_month)
  `ruby run.rb '#{print_type}' #{print_year}`
end

context 'User sketches a full-year log file' do
  before :all do
    `rm -rf #{@out_directory}`
    out_directory = './_out'
    file_name = "#{out_directory}/DO_2020.md"
    @file_path = Pathname.new(file_name)

    file_contents = IO.read(@file_path)

    file_parser = FileParser.new
    @do_hash = file_parser.get_date_hash_from_do_file(file_contents)
  end

  context 'when creating a whole year' do
    create_log_file('test/test_config.yml', 'DO', 2020, 'ALL')

    it 'creates the log file' do
      expect(@file_path).to exist
    end

    it 'creates adds dates to the log file' do
      expect(@do_hash['2020-01-01']).to_not be(nil)
    end
  end

  context 'when creating holidays' do
    it 'creates New Years Day' do
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
