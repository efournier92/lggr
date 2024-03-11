require './models/config_reader'
require './models/task_printer'
require './spec/constants/test_constants'
require './constants/config_constants'
require 'pry-byebug'

describe TaskPrinter do
  before :each do
    @config_reader = ConfigReader.new(TEST_CONFIG_FILES[:TEST_PATH])
    @config = @config_reader.read_file(TEST_CONFIG_FILES[:TEST_PATH])
    @config_tasks = @config[CONFIG_KEYS[:TASKS]]

    @printer = TaskPrinter.new()
    @config_tasks = @config[CONFIG_KEYS[:TASKS]]
  end

  context 'given a single 1-dimentional task to print' do
    it 'formats the task appropriately' do
      task_name = TEST_CONFIG_KEYS[:DIMENTIONAL_1]
      task = @config_tasks[task_name]

      task_printed = @printer.print(task)

      expected_output = "Level_1,\n"
      expect(task_printed).to eq(expected_output)
    end
  end

  context 'given multiple 1-dimentional tasks to print' do
    it 'formats the task appropriately' do
      task_name = TEST_CONFIG_KEYS[:DIMENTIONAL_1_DOUBLE]
      task = @config_tasks[task_name]

      task_printed = @printer.print(task)

      expected_output = "Level_1a,\nLevel_1b,\n"
      expect(task_printed).to eq(expected_output)
    end
  end

  context 'given a 2-dimentional task to print' do
    it 'formats the task appropriately' do
      task_name = TEST_CONFIG_KEYS[:DIMENTIONAL_2]
      task = @config_tasks[task_name]

      task_printed = @printer.print(task)

      expected_output = "Level_1(\n  Level_2,\n),\n"
      expect(task_printed).to eq(expected_output)
    end
  end

  context 'given a 3-dimentional task to print' do
    it 'formats the task appropriately' do
      task_name = TEST_CONFIG_KEYS[:DIMENTIONAL_3]
      task = @config_tasks[task_name]

      task_printed = @printer.print(task)

      expected_output = "Level_1(\n  Level_2(\n    Level_3,\n  ),\n),\n"
      expect(task_printed).to eq(expected_output)
    end
  end

  context 'given a 3-dimentional task to print with leaf siblings on the bottom level' do
    it 'formats the task appropriately' do
      task_name = TEST_CONFIG_KEYS[:DIMENTIONAL_3_SIBLINGS_LEAF]
      task = @config_tasks[task_name]

      task_printed = @printer.print(task)

      expected_output = "Level_1(\n  Level_2(\n    Level_3,\n    Level_3,\n  ),\n),\n"
      expect(task_printed).to eq(expected_output)
    end
  end

  context 'given a 3-dimentional task to print with internal siblings on the middle level' do
    it 'formats the task appropriately' do
      task_name = TEST_CONFIG_KEYS[:DIMENTIONAL_3_SIBLINGS_INTERNAL]
      task = @config_tasks[task_name]

      task_printed = @printer.print(task)

      expected_output = "Level_1(\n  Level_2a(\n    Level_3,\n  ),\n  Level_2b(\n    Level_3,\n  ),\n),\n"
      expect(task_printed).to eq(expected_output)
    end
  end

  context 'given a 2-dimentional task to print with mixed leaf and internal siblings' do
    it 'formats the task appropriately' do
      task_name = TEST_CONFIG_KEYS[:DIMENTIONAL_2_MIXED]
      task = @config_tasks[task_name]

      task_printed = @printer.print(task)

      expected_output = "Level_1a(\n  Level_2a(\n    Level_3a,\n  ),\n  Level_2b,\n),\n"
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
        node_name = TEST_CONFIG_KEYS[:DIMENTIONAL_1]
        node = @config_tasks[node_name]

        output = @printer.is_leaf?(node)

        expect(output).to be true
      end
    end

    context 'given an internal node' do
      it 'returns false' do
        node_name = TEST_CONFIG_KEYS[:DIMENTIONAL_3]
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

  describe '#print_from_template' do
    context 'given a special tag with a configured template' do
      it 'inserts the special tag content inside the template' do
        task = @config[CONFIG_KEYS[:SPECIAL]][TEST_CONFIG_KEYS[:NEW_YEARS_DAY]]
        content = task[CONFIG_KEYS[:CONTENT]]
        template_name = task[CONFIG_KEYS[:TEMPLATE]]
        template = @config[CONFIG_KEYS[:TEMPLATES]][template_name]

        output = @printer.print_from_template(template, content)

        expect(output).to eql("Holiday(\n  #{TEST_CONFIG_KEYS[:NEW_YEARS_DAY]},\n),\n")
      end
    end
  end

  describe '#is_template_string' do
    context 'given a template node' do
      it 'returns true' do
        input = '((CONTENT))'

        output = @printer.is_template_string?(input)

        expect(output).to eql(true)
      end
    end

    context 'given a non-template node' do
      it 'returns false' do
        input = 'some string'

        output = @printer.is_template_string?(input)

        expect(output).to eql(false)
      end
    end
  end

  describe '#replace_template_content' do
    context 'given a template for content replacement' do
      it 'replaces the placeholder with content' do
        template = 'This_((CONTENT))_Tag'
        content = 'Example'
        output = @printer.replace_template_content(template, content)

        expected_output = 'This_Example_Tag'
        expect(output).to eql(expected_output)
      end
    end
  end
end
