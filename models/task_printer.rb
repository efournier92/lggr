class TaskPrinter
  attr_reader :output

  def initialize()
    @output = ''
    @currentDepth = 0
  end

  def print(task)
    print_node(task)
    @output
  end

  def append_output(text)
    @output = @output + text
  end

  def print_node(node)
    if is_leaf?(node)
      node.each do |text|
        append_leaf(text)
      end
    else
      print_internal(node)
    end
  end

  def print_internal(node)
    node.each do |text, task|
      append_internal(text)
      increment_depth
      print_node(task)
      decrement_depth
      print_closer()
    end
  end

  def append_internal(text)
    append_spacing
    append_output(text)
    append_output('(')
  end

  def append_leaf(text)
    append_spacing
    append_output(text)
    append_output(',')
  end

  def print_closer()
    append_output("\n")
    append_indents(@currentDepth)
    append_output('),')
  end

  def append_spacing()
    if (@currentDepth > 0)
      append_output("\n")
    end
    append_indents(@currentDepth)
  end

  def append_indents(depth)
    append_output(' ' * depth * 2)
  end

  def is_leaf?(node)
    return node.is_a?(Array)
  end

  def increment_depth()
    @currentDepth = @currentDepth + 1
  end

  def decrement_depth()
    @currentDepth = @currentDepth - 1
  end

end
