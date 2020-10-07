module Commands
  class Number < Base
    def can_process?
      string =~ /^-?\d+?[,.]\d+?$/
    end

    def process(_first, _second)
      string.to_f
    end
  end
end
