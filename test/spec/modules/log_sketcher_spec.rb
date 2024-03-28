require 'pry-byebug'
require './src/modules/log_sketcher'
require './test/constants/test_constants'

describe LogSketcher do
  context 'given main is executed with a month' do
    before :all do
      @output_dir = TestConstants::OUTPUT[:DIRECTORY]
    end

    after :all do
      `rm -rf #{@output_dir}`
    end

    it 'prints january 1st' do
      sketcher = LogSketcher.new(TestConstants::CONFIG_FILES[:TEST_PATH], 'DO', 2020, 1, @output_dir)
      output = sketcher.main
      january_1st = output[0].days.find { |day| day.year == 2020 && day.month == 1 && day.month_day == 1 }

      expect(january_1st).to_not be_nil
    end
  end

  context 'given main is executed without a month' do
    it 'prints january 1st' do
      sketcher = LogSketcher.new(TestConstants::CONFIG_FILES[:TEST_PATH], 'DO', 2020, 1, @output_dir)
      output = sketcher.main
      january_1st = output[0].days.find { |day| day.year == 2020 && day.month == 1 && day.month_day == 1 }

      expect(january_1st).to_not be_nil
    end
  end
end
