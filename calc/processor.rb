class Processor
  attr_reader :input, :cache, :command

  def initialize(input, cache)
    @input = input
    @cache = cache
    @command = ::Commands::AVAILABLE.find { |command_class| command_class.new(input).can_process? }
  end

  def call
    raise NotImplementedError if command.nil?
    command.new(input).process(cache.first, cache.last)
  end

  def exit?
    command && command == Commands::Exit
  end
end
