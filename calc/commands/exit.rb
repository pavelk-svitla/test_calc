module Commands
  class Exit < Base
    def can_process?
      string.empty? || string =~ /^q$/ || string =~ /^\^[CD]$/
    end

    def process(first, second)
      first + second
    end
  end
end
