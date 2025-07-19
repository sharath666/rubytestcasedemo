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


calculator = StringCalculator.new

puts calculator.add("")             # => 0
puts calculator.add("1")            # => 1
puts calculator.add("1,5")          # => 6
puts calculator.add("1\n2,3")       # => 6
puts calculator.add("//;\n1;2;3")   # => 6

# Negative number example (will raise error):
begin
  calculator.add("1,-2,3,-4")
rescue => e
  puts e.message # => "negative numbers not allowed: -2,-4"
end
