require 'set'
require 'pry'

def factor_list(numbers)
  numbers = numbers.sort
  numbers.each_with_object({}).with_index do |(number, result), index|
    potential_factors = numbers[0, index]
    actual_factors = potential_factors.select do |potential_factor|
      number % potential_factor == 0
    end
    result[number] = actual_factors
  end
end

