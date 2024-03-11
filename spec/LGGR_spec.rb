require 'pry-byebug'
require './LGGR'
require './spec/constants/test_constants'

describe Lggr do
  context 'given main is executed' do
    it 'accepts all inputs' do
      lggr = Lggr.new(TEST_CONFIG_FILES[:TEST_PATH], 'DO', 2020, 1)
      output = lggr.main()
    end
  end
end
