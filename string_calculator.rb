class StringCalculator
    def add(input)
      return 0 if input.nil? || input.strip.empty?
      delimiter = /,|\n/
      numbers_section = input

      # Check for custom delimiter
      if input.start_with?("//")
        header, numbers_section = input.split("\n", 2)
        delimiter = Regexp.escape(header[2]) # single-char delimiter
      end
      numbers = numbers_section.split(/#{delimiter}/).map(&:to_i)
      negatives = numbers.select { |n| n < 0 }
      raise "negative numbers not allowed: #{negatives.join(',')}" unless negatives.empty?
      numbers.sum
    end
end