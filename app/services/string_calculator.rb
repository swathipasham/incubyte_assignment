class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
   
    #check and raise exception if the input has negative numbers
    negative_numbers = numbers.scan(/-[\d]+/).join(', ')
    raise StandardError, "negative numbers not allowed: #{negative_numbers}" if negative_numbers.present?

    # check if the input has a custom delimiter
    if numbers.start_with?('//') 
      delimiter = numbers[2]      #custom delimiter
      numbers = numbers.split("\n")[1] #numbers after the new line character
      numbers.split(delimiter).map(&:to_i).select { |num| num <= 1000 }.sum  #split the numbers by the custom delimiter and ignores number greater than 1000  and sum them
    else
      numbers.split(/[\n,]/).map(&:to_i).select { |num| num <= 1000 }.sum # split the numbers by new line and comma and ignores number greater than 1000  and sum them
    end

  end
end