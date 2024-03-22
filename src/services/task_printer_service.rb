require './src/constants/config_constants'

class TaskPrinterService
  attr_reader :output

  def initialize
    @output = ''
    @current_depth = 0
    @current_node = 0
  end

  def print(task)
    print_node(task)
    "#{@output}\n"
  end

  def append_output(text)
    @output += text
  end

  def print_node(node)
    if leaf?(node)
      print_leaf(node)
    else
      print_internal(node)
    end
  end

  def print_leaf(node)
    return if node.nil?

    node.each do |text|
      append_leaf(text)
      @current_node += 1
    end
  end

  def print_internal(node)
    return if node.nil?

    node.each do |text, task|
      if task.nil?
        append_leaf(text)
      else
        append_internal(text)
        @current_node += 1
        increment_depth
        print_node(task)
        decrement_depth
        print_closer
      end
    end
  end

  def append_internal(text)
    append_output("\n") if @current_depth.zero? && @current_node.positive?
    append_spacing
    append_output(text)
    append_output('(')
  end

  def append_leaf(text)
    append_output("\n") if @current_depth.zero? && @current_node.positive?
    append_spacing
    append_output(text)
    append_output(',')
  end

  def print_closer
    append_output("\n")
    append_indents(@current_depth)
    append_output('),')
  end

  def append_spacing
    append_output("\n") if @current_depth.positive?
    append_indents(@current_depth)
  end

  def append_indents(depth)
    append_output(' ' * depth * 2)
  end

  def leaf?(node)
    node.is_a?(Array)
  end

  def increment_depth
    @current_depth += 1
  end

  def decrement_depth
    @current_depth -= 1
  end

  def print_from_template(template, content)
    # Clone to avoid mutating the original template
    template_updated = Marshal.load(Marshal.dump(template))

    template_updated.each_value do |template_nodes|
      next if template_nodes.nil?

      template_nodes.each do |node_name, node_content|
        # next if node_content.nil?

        template_string = node_content && !node_content[0].nil? ? node_content[0] : node_name
        content_string = content && !content[node_name].nil? ? content[node_name] : content

        if template_string?(template_string)
          placeholder = get_placeholder(template_string)
          replace_template_content(template_string, placeholder, content_string)
        end
      end
    end

    print(template_updated)

    "#{@output}\n"
  end

  def get_placeholder(input)
    start_marker = ConfigConstants::PLACEHOLDERS[:TEMPLATE_START]
    end_marker = ConfigConstants::PLACEHOLDERS[:TEMPLATE_END]
    content_between_markers = input[/#{Regexp.escape(start_marker)}(.*?)#{Regexp.escape(end_marker)}/m, 1]
    start_marker + content_between_markers + end_marker
  end

  def template_string?(string)
    string.include?(ConfigConstants::PLACEHOLDERS[:TEMPLATE_START]) &&
      string.include?(ConfigConstants::PLACEHOLDERS[:TEMPLATE_END])
  end

  def replace_template_content(string_with_placeholder, placeholder, content)
    string_with_placeholder.gsub!(placeholder, content)
  end
end
