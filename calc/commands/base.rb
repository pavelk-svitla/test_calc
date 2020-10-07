module Commands
  class Base
    attr_reader :string

    def initialize(string)
      @string = string
    end

    def process(_first, _second)
      raise NotImplementedError
    end

    def can_process?
      false
    end
  end
end
