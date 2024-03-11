require './src/constants/config_constants'

class TaskPrinterService
  attr_reader :output

  def initialize()
    @output = ''
    @current_depth = 0
    @current_node = 0
  end

  def print(task)
    print_node(task)
    @output + "\n"
  end

  def append_output(text)
    @output = @output + text
  end

  def print_node(node)
    if is_leaf?(node)
      print_leaf(node)
    else
      print_internal(node)
    end
  end

  def print_leaf(node)
    return if (node.nil?)

    node.each do |text|
      append_leaf(text)
      @current_node = @current_node + 1
    end
  end

  def print_internal(node)
    return if (node.nil?)

    node.each do |text, task|
      if (task.nil?)
        append_leaf(text)
      else
        append_internal(text)
        @current_node = @current_node + 1
        increment_depth
        print_node(task)
        decrement_depth
        print_closer()
      end
    end
  end

  def append_internal(text)
    append_output("\n") if (@current_depth == 0 && @current_node > 0)
    append_spacing
    append_output(text)
    append_output('(')
  end

  def append_leaf(text)
    append_output("\n") if (@current_depth == 0 && @current_node > 0)
    append_spacing
    append_output(text)
    append_output(',')
  end

  def print_closer()
    append_output("\n")
    append_indents(@current_depth)
    append_output('),')
  end

  def append_spacing()
    if (@current_depth > 0)
      append_output("\n")
    end
    append_indents(@current_depth)
  end

  def append_indents(depth)
    append_output(' ' * depth * 2)
  end

  def is_leaf?(node)
    return node.is_a?(Array)
  end

  def increment_depth()
    @current_depth = @current_depth + 1
  end

  def decrement_depth()
    @current_depth = @current_depth - 1
  end

  def print_from_template(template, content)
    # Clone to avoid mutating the original template
    template_updated = Marshal.load(Marshal.dump(template))

    template_updated.each do |name, arr|
      arr.each do |string|
        if (is_template_string?(string))
          replace_template_content(string, content)
        end
      end
    end

    print(template_updated)

    @output + "\n"
  end

  def is_template_string?(string)
    string.include?(ConfigConstants::PLACEHOLDERS[:CONTENT])
  end

  def replace_template_content(template, content)
    template.gsub!(ConfigConstants::PLACEHOLDERS[:CONTENT], content)
  end

end
