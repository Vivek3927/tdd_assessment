# String calculator for add numbers

class StringCalculator
	def add(numbers)
		delimiter = /,|\n/
		if numbers.start_with?("//")
			delimiter_header, numbers = numbers.split("\n", 2)
      delimiter_part = delimiter_header[2..] # remove the leading "//"
			delimiter = Regexp.escape(delimiter_part)
		end

		nums = numbers.split(/#{delimiter}/).map(&:to_i)

		negatives = nums.select { |n| n < 0 }
		unless negatives.empty?
			raise "negative numbers not allowed: #{negatives.join(',')}"
		end

		nums.sum
	end
end

s = StringCalculator.new
puts s.add("") # Output : 0
puts s.add("1") # Output : 1
puts s.add("1,5") # Output : 6