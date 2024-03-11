require 'pry-byebug'
require './src/modules/log_sketcher'
require './spec/constants/test_constants'

describe LogSketcher do
  context 'given main is executed' do
    it 'accepts all inputs' do
      sketcher = LogSketcher.new(TEST_CONFIG_FILES[:TEST_PATH], 'DO', 2020, 1)
      output = sketcher.main()
    end
  end
end
