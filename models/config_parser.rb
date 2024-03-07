require 'yaml'
require 'pry-byebug'

class ConfigParser

  def initialize()
    @task_string = ''
    @depth = 0
  end

  def read_file(file_path)
    config = YAML.load_file(file_path)
    return config
  end

  def print_task(task)
    output_string = print_node(task, "")
    "#{output_string}"
  end

  def is_leaf?(node)
    return node.is_a?(Array)
  end

  def print_n_spaces(times)
    ' ' * times
  end

  def print_line(is_leaf, is_close, text)
    if (@depth > 0)
      output = "\n#{print_n_spaces(@depth * 2)}"
    end

    if (is_close)
      output = "#{output}),"
    elsif (is_leaf)
      output = "#{output}#{text},"
    else
      output = "#{output}#{text}("
    end

    output
  end

  def print_node(node, output_string)
    if is_leaf?(node)
      node.each do |text|
        output_string = "#{output_string}#{print_line(true, false, text)}"
      end
    else
      output_string = print_internal(node, output_string)
    end

    output_string
  end

  def print_leaf(node, output_string)
    "#{output_string}#{node[0]}(),"
  end

  def print_internal(node, output_string)
    node.each do |text, task|
      output_string = "#{output_string}#{print_line(false, false, text)}"
      @depth = @depth + 1
      output_string = print_node(task, output_string)
      @depth = @depth - 1
      output_string = "#{output_string}\n#{print_n_spaces(@depth * 2)}),"
    end
    output_string
  end

  def get_closing()
    if (@depth == 0)
      ""
    else
      "\n),"
    end
  end
end
