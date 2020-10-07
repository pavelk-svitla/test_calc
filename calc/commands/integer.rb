module Commands
  class Integer < Base
    def can_process?
      string =~ /^-?\d+?$/
    end

    def process(_first, _second)
      string.to_i
    end
  end
end
