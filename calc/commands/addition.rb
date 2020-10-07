module Commands
  class Addition < Base
    def can_process?
      string =~ /^\+$/
    end

    def process(first, second)
      first + second
    end
  end
end
