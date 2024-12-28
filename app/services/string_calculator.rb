class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
   
    #check and raise exception if the input has negative numbers
    negative_numbers = numbers.scan(/-[\d]+/).join(', ')
    raise StandardError, "negative numbers not allowed: #{negative_numbers}" if negative_numbers.present?

   
    # check if the input has a multiple delimeters of any length
    if numbers.start_with?('//[')
      delimiters = numbers.scan(/\[.*?\]/).map { |delimiter| delimiter.gsub(/[\[\]]/, '') } #get the delimiters
      numbers = numbers.split("\n")[1] #get the numbers after the new line character
      delimiters.each do |delimiter|
         numbers = numbers.split(delimiter).join(',') #split the numbers by the delimiters and join them by comma
      end
    elsif numbers.start_with?('//') # check if the input has a delimiter 
      delimiter = numbers[2]
      numbers = numbers.split("\n")[1] #numbers after the new line character
      numbers = numbers.split(delimiter).join(',')   #split the numbers by the custom delimiter
    else
      numbers =  numbers.split(/[\n,]/).join(',')  #split the numbers by new line and comma
    end

    numbers.split(',').map(&:to_i).select { |num| num <= 1000 }.sum #convert the numbers to integer, ignore numbers greater than 100 and sum them
  end
end