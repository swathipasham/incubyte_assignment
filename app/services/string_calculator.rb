class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
   
    #check if the input has a custom delimiter
    negative_numbers = numbers.scan(/-[\d]+/).join(', ')
    raise StandardError, "negative numbers not allowed: #{negative_numbers}" if negative_numbers.present?

    numbers.split(/[\n,]/).map(&:to_i).sum # split the numbers by new line and comma and sum them
  end
end