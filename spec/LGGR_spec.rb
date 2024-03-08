require 'pry-byebug'
require './LGGR'

describe Lggr do
  TEST_CONFIG_PATH = './spec/test_config.yml'

  context 'give main is executed' do
    it 'accepts all inputs' do
      lggr = Lggr.new('DO', 2020, 1)
      output = lggr.main()
    end
  end
end
