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
      it 'expands a configured template adds tags to a specific date' do
        year = Year.new(2020, TEST_CONFIG_FILES[:TEST_PATH])
        @tagService.add_special_tags(year)

        week = year.weeks[1]
        january_1 = week.days.find { |day| day.month_day == 1 }

        expect(january_1.tasks).to include("Holiday(\n  New_Years_Day,\n),\n")
      end
    end
  end
end
