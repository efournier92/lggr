require './models/Year'
require './models/Week'
require './models/Day'
require './models/Task'

describe Year do
  TEST_CONFIG_PATH = './spec/test_config.yml'

  context "given a year" do
    it "returns an object" do
      expect(Year.new(2023, config_file)).to be_an_instance_of(Year)
    end
  end
end
