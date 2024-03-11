require './src/services/special_tag_service'
require './src/models/year'
require './spec/constants/test_constants'
require 'pry-byebug'

describe SpecialTagService do
  before :each do
    @tagService = SpecialTagService.new()
  end

  context 'given class construction' do
    it 'creates the service' do
      tagService = SpecialTagService.new()
    end

    describe '#add_special_tags' do
      it 'adds a tag based on a configured template to a specific date' do
        year = Year.new(2020, TestConstants::CONFIG_FILES[:TEST_PATH])
        @tagService.add_special_tags(year)

        week = year.weeks[1]
        january_1 = week.days.find { |day| day.month_day == 1 }
        holiday_name = TestConstants::HOLIDAYS[:FIRST_DAY]

        expect(january_1.tasks).to include("Holiday(\n  #{holiday_name},\n),\n")
      end

      it 'adds a tag based on a configured template to the 2nd Tuesday in a month' do
        year = Year.new(2020, TestConstants::CONFIG_FILES[:TEST_PATH])
        @tagService.add_special_tags(year)

        week = year.weeks[3]
        day = week.days.find { |day| day.name == 'Tuesday' }
        holiday_name = TestConstants::HOLIDAYS[:NTH_XDAY]

        expect(day.tasks).to include("Holiday(\n  #{holiday_name},\n),\n")
      end
    end
  end
end
