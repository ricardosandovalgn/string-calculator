# frozen_string_literal: true

class StringCalculator
  def add(string)
    return 0 if string.empty?

    number_to_add = string.split(/[^\d]/).map { |num| num.to_i }
    number_to_add.sum
  end

end
