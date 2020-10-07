module Commands
  class Multiplication < Base
    def can_process?
      string =~ /^\*$/
    end

    def process(first, second)
      first * second
    end
  end
end
