# example to run calc

require_relative 'calc/listener'
require_relative 'calc/commands'
require_relative 'calc/processor'
require_relative 'calc/interface'

@memory = []

puts Interface::HEADER

loop do
  print Interface::MARKER
  listener = Listener.new(gets)
  processor = Processor.new(listener.call, Array(@memory[-2, 2]))

  break if processor.exit?

  begin
    result = processor.call
    @memory << result
    puts result
  rescue NotImplementedError
    puts Interface::NOT_IMPLEMENTED
  end
end

puts Interface::FOOTER
