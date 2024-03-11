require './models/Year'
require './models/Week'
require './models/Day'
require './models/Task'
require './spec/constants/test_constants'

describe Year do
  context "given a year" do
    it "returns an object" do
      expect(Year.new(2023, TEST_CONFIG_FILES[:TEST_PATH])).to be_an_instance_of(Year)
    end
  end
end
