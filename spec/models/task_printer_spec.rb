require './models/config_reader'
require './models/task_printer'

describe TaskPrinter do
  TEST_CONFIG_PATH = './spec/test_config.yml'
  CONFIG_KEYS = {
    TASKS: 'tasks',
    DIMENTIONAL_1: '1_Dimentional',
    DIMENTIONAL_2: '2_Dimentional',
    DIMENTIONAL_3: '3_Dimentional',
    DIMENTIONAL_3_SIBLINGS_LEAF: '3_Dimentional_Leaf_Siblings',
    DIMENTIONAL_3_SIBLINGS_INTERNAL: '3_Dimentional_Internal_Siblings',
  }

  before :each do
    @config_reader = ConfigReader.new()
    @config = @config_reader.read(TEST_CONFIG_PATH)
    @config_tasks = @config[CONFIG_KEYS[:TASKS]]

    @printer = TaskPrinter.new()
    @config_tasks = @config[CONFIG_KEYS[:TASKS]]
  end

  context 'given a 1-dimentional task to print' do
    it 'formats the task appropriately' do
      task_name = CONFIG_KEYS[:DIMENTIONAL_1]
      task = @config_tasks[task_name]

      task_printed = @printer.print(task)

      expected_output = 'Level_1,'
      expect(task_printed).to eq(expected_output)
    end
  end

  context 'given a 2-dimentional task to print' do
    it 'formats the task appropriately' do
      task_name = CONFIG_KEYS[:DIMENTIONAL_2]
      task = @config_tasks[task_name]

      task_printed = @printer.print(task)

      expected_output = "Level_1(\n  Level_2,\n),"
      expect(task_printed).to eq(expected_output)
    end
  end

  context 'given a 3-dimentional task to print' do
    it 'formats the task appropriately' do
      task_name = CONFIG_KEYS[:DIMENTIONAL_3]
      task = @config_tasks[task_name]

      task_printed = @printer.print(task)

      expected_output = "Level_1(\n  Level_2(\n    Level_3,\n  ),\n),"
      expect(task_printed).to eq(expected_output)
    end
  end

  context 'given a 3-dimentional task to print with leaf siblings on the bottom level' do
    it 'formats the task appropriately' do
      task_name = CONFIG_KEYS[:DIMENTIONAL_3_SIBLINGS_LEAF]
      task = @config_tasks[task_name]

      task_printed = @printer.print(task)

      expected_output = "Level_1(\n  Level_2(\n    Level_3,\n    Level_3,\n  ),\n),"
      expect(task_printed).to eq(expected_output)
    end
  end

  context 'given a 3-dimentional task to print with internal siblings on the middle level' do
    it 'formats the task appropriately' do
      task_name = CONFIG_KEYS[:DIMENTIONAL_3_SIBLINGS_INTERNAL]
      task = @config_tasks[task_name]

      task_printed = @printer.print(task)

      expected_output = "Level_1(\n  Level_2a(\n    Level_3,\n  ),\n  Level_2b(\n    Level_3,\n  ),\n),"
      expect(task_printed).to eq(expected_output)
    end
  end

  describe '#append_output' do
    context 'given text to append with no existing output' do
      before :each do
        text = "TextToAppend"

        @output = @printer.append_output(text)

        @expected_output = text
      end

      it 'returns the appended text' do
        expect(@output).to eql(@expected_output)
      end

      it 'appends the text to output attribute' do
        expect(@printer.output).to eql(@expected_output)
      end
    end

    context 'given text to append with existing output' do
      before :each do
        initial_text = 'InitialToAppend'
        appended_text = 'AppendedText'

        @printer.append_output(initial_text)
        @output = @printer.append_output(appended_text)

        @expected_output = initial_text + appended_text
      end

      it 'returns an string with text appended to the existing output' do
        expect(@output).to eql(@expected_output)
      end

      it 'appends the string he output attribute' do
        expect(@printer.output).to eql(@expected_output)
      end
    end

    context 'given an empty string to append' do
      before :each do
        text = ''

        @output = @printer.append_output(text)

        @expected_output = ''
      end

      it 'returns an empty string' do
        expect(@output).to eql(@expected_output)
      end

      it 'appends nothing to the output attribute' do
        expect(@printer.output).to eql(@expected_output)
      end
    end
  end

  describe '#append_indents' do
    context 'given the supplied depth is 0' do
      it 'does not append any indent to the output attribute' do
        initial_text = 'InitialText'
        final_text = 'FinalText'
        depth = 0

        @printer.append_output(initial_text)
        @printer.append_indents(depth)
        @printer.append_output(final_text)

        expected_output = initial_text + final_text

        expect(@printer.output).to eql(expected_output)
      end
    end
  end

  context 'given the supplied depth is 1' do
    it 'appends an indent of 2 spaces to the output attribute' do
      initial_text = 'InitialText'
      final_text = 'FinalText'
      expected_indent = '  '
      depth = 1

      @printer.append_output(initial_text)
      @printer.append_indents(depth)
      @printer.append_output(final_text)

      expected_output = initial_text + expected_indent + final_text

      expect(@printer.output).to eql(expected_output)
    end
  end

  describe '#is_leaf' do
    context 'given a leaf node' do
      it 'returns true' do
        node_name = CONFIG_KEYS[:DIMENTIONAL_1]
        node = @config_tasks[node_name]

        output = @printer.is_leaf?(node)

        expect(output).to be true
      end
    end

    context 'given an internal node' do
      it 'returns false' do
        node_name = CONFIG_KEYS[:DIMENTIONAL_3]
        node = @config_tasks[node_name]

        output = @printer.is_leaf?(node)

        expect(output).to be false
      end
    end

    context 'given nil' do
      it 'returns false' do
        node = nil

        output = @printer.is_leaf?(node)

        expect(output).to be false
      end
    end

    context 'given a string' do
      it 'returns false' do
        node = 'BadInput'

        output = @printer.is_leaf?(node)

        expect(output).to be false
      end
    end
  end

  describe '#increment_depth' do
    context 'given a call to #increment_depth' do
      it 'increments currentDepth by 1 on each call' do
        output = @printer.increment_depth()

        expect(output).to eql(1)

        output = @printer.increment_depth()

        expect(output).to eql(2)
      end
    end
  end

  describe '#decrement_depth' do
    context 'given a call to #decrement_depth' do
      it 'decrements currentDepth by 1 on each call' do
        output = @printer.increment_depth()
        output = @printer.increment_depth()
        expect(output).to eql(2)

        output = @printer.decrement_depth()
        expect(output).to eql(1)

        output = @printer.decrement_depth()
        expect(output).to eql(0)
      end
    end
  end
end
