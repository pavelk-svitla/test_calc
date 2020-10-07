module Commands
  class Division < Base
    def can_process?
      string =~ /^\/$/
    end

    def process(first, second)
      first / second.to_f
    end
  end
end
