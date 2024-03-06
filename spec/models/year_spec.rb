require './models/Year'
require './models/Week'
require './models/Day'
require './models/Task'

describe Year do
  context "given a year" do
    it "returns an object" do
      expect(Year.new(2023)).to be_an_instance_of(Year)
    end
  end
end
