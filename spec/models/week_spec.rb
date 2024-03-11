require './src/models/week'
require './src/models/day'
require './models/Task'
require './spec/constants/test_constants'
require 'pry-byebug'

describe Week do
  context 'given a new week' do
    before :all do
      week_index = 1
      month = 1
      days_this_week = Week.days_this_week(1, month, 31)
      year = 2000

      week = Week.new(week_index, days_this_week, year, month, TEST_CONFIG_FILES[:TEST_PATH])
      @days = week.days
    end

    it 'has days for each day in the week' do
      expect(@days.count).to eql(7)
    end

    context 'given tasks configured against specific days' do
      it 'has a 1-dimentional string of configured tasks printed against Monday' do
        day_name = 'Monday'
        day = @days.find { |day| day.name == day_name }
        expect(day.tasks).to eql("Level_1,\n")
      end

      it 'has a multi-dimentional string of configured tasks printed against Friday' do
        day_name = 'Friday'
        day = @days.find { |day| day.name == day_name }
        expect(day.tasks).to eql("Level_1(\n  Level_2(\n    Level_3,\n  ),\n),\n")
      end

      it 'prints multiple configured tasks in a string' do
        day_name = 'Thursday'
        day = @days.find { |day| day.name == day_name }
        expect(day.tasks).to eql("Level_1,\nLevel_1(\n  Level_2(\n    Level_3,\n  ),\n),\n")
      end
    end
  end
end
