# Adapted from https://github.com/bronson/vim-runtest/blob/master/rspec_formatter.rb.
require 'rspec/core/formatters/base_text_formatter'

class VimFormatter < RSpec::Core::Formatters::BaseTextFormatter
  RSpec::Core::Formatters.register self, :example_failed

  def example_failed notification
    example = notification.example
    exception = example.execution_result.exception
    example_group = example.example_group
    path = $1 if exception.backtrace.find do |frame|
      frame =~ %r{\b(spec/.*_spec\.rb:\d+)(?::|\z)}
    end

    if path
      output.puts format_message("#{path}: #{example_group.description.strip} #{example.description.strip}: #{exception.message}")
    end
  end

  def dump_summary(a)

    output.puts "asd\n"
    output.puts "asd\n"
    output.puts "asd\n"
    output.puts "asd\n"
    output.puts "asd\n"
  end

  def dump_failures(notification)
    require 'pry'
    binding.pry
    output.puts notification.fully_formatted_failed_examples
  end
  private

  def format_message msg
    RSpec::Core::Formatters::ConsoleCodes.wrap(msg.gsub("\n", ' ')[0,80], :failure)
  end

end
