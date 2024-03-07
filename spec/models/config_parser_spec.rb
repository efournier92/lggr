require './models/config_parser'

describe ConfigParser do
  before :each do
    @config_parser = ConfigParser.new()
    @config = @config_parser.read_file('./spec/sample_config.yml')
  end

  context "given a node to check if it's a leaf" do
    it "returns true when given a leaf node" do
      leaf_node = @config['tasks']['1_Dimentional']
      is_leaf = @config_parser.is_leaf?(leaf_node)
      expect(is_leaf).to eq(true)
    end

    it "returns false when given an internal node" do
      internal_node = @config['tasks']['2_Dimentional']
      is_leaf = @config_parser.is_leaf?(internal_node)
      expect(is_leaf).to eq(false)
    end
  end

  context "given a leaf node to print" do
    context "without a preexisting output_string" do
      it "it returns a properly formatted string" do
        leaf_node = @config['tasks']['1_Dimentional']
        leaf_printed = @config_parser.print_leaf(leaf_node, "")

        expect(leaf_printed).to eq('Level_1(),')
      end
    end

    context "with a preexisting output_string" do
      it "returns a properly formatted string" do
        leaf_node = @config['tasks']['1_Dimentional']
        preexisting_output_string = 'Test('
        leaf_printed = @config_parser.print_leaf(leaf_node, preexisting_output_string)

        expect(leaf_printed).to eq("#{preexisting_output_string}Level_1(),")
      end
    end
  end

  context "given a character to print n times" do
    it "returns the supplied number of spaces 2" do
      times = 2
      result = @config_parser.print_n_spaces(times)

      expect(result).to eql('  ')
    end

    it "returns the supplied number of spaces 4" do
      times = 4
      result = @config_parser.print_n_spaces(times)

      expect(result).to eql('    ')
    end
  end

  context "given a config file path" do
    it "returns a hash" do
      expect(@config).to be_an_instance_of(Hash)
    end

    it "reads a hash of tasks" do
      expect(@config['tasks']).to be_an_instance_of(Hash)
    end

    it "reads a 1-dimentional task" do
      expect(@config['tasks']['1_Dimentional']).to be_an_instance_of(Array)
    end

    it "reads a multi-dimentional task" do
      expect(@config['tasks']['3_Dimentional']).to be_an_instance_of(Hash)
    end
  end

  context "given a task to print" do
    context "given a 1-dimentional task" do
      it "formats a 1-dimentional task" do
        task = @config['tasks']['1_Dimentional']
        task_printed = @config_parser.print_task(task)

        expect(task_printed).to eq('Level_1,')
      end
    end

    context "given a multi-dimentional task" do
      it "formats a 2-dimentional task" do
        task = @config['tasks']['2_Dimentional']
        task_printed = @config_parser.print_task(task)

        expect(task_printed).to eq("Level_1(\n  Level_2,\n),")
      end

      it "formats a 3-dimentional task" do
        task = @config['tasks']['3_Dimentional']
        task_printed = @config_parser.print_task(task)

        expect(task_printed).to eq("Level_1(\n  Level_2(\n    Level_3,\n  ),\n),")
      end

      it "formats a 3-dimentional task with leaf siblings on the 3rd level" do
        task = @config['tasks']['3_Dimentional_Leaf_Siblings']
        task_printed = @config_parser.print_task(task)

        expect(task_printed).to eq("Level_1(\n  Level_2(\n    Level_3,\n    Level_3,\n  ),\n),")
      end

      it "formats a 3-dimentional task with internal siblings on the 3rd level" do
        task = @config['tasks']['3_Dimentional_Internal_Siblings']
        task_printed = @config_parser.print_task(task)

        expect(task_printed).to eq("Level_1(\n  Level_2a(\n    Level_3,\n  ),\n  Level_2b(\n    Level_3,\n  ),\n),")
      end
    end
  end
end
