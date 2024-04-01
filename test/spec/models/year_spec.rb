require './src/models/year'
require './src/models/day'
require './test/constants/test_constants'

describe Year do
  context 'given a year' do
    it 'returns an object' do
      expect(Year.new(2020, TestConstants::CONFIG_FILES[:TEST_PATH])).to be_an_instance_of(Year)
    end
  end
end
