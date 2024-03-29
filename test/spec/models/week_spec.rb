require './src/models/week'
require './src/models/day'
require './test/constants/test_constants'

describe Week do
  context 'given a new week' do
    before :all do
      week_index = 1
      month = 1
      days_this_week = Week.days_this_week(1, month, 31)
      year = 2000

      week = Week.new(week_index, days_this_week, year, month, TestConstants::CONFIG_FILES[:TEST_PATH])
      @days = week.days
    end

    it 'has days for each day in the week' do
      expect(@days.count).to eql(7)
    end
  end
end
