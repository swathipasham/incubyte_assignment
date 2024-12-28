class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    return numbers.to_i if numbers.length == 1
    return numbers.split(',')[0].to_i + numbers.split(',')[1].to_i
  end
end