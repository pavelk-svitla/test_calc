class Listener
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def call
    input.to_s.strip
  end
end
