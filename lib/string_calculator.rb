class StringCalculator

  attr_accessor :called_count, :positives, :negatives
  LIMIT = 1_000.freeze
  REGEX = /[^-?\d+(\.\d+)?$]/.freeze
  def initialize
    @numbers = Hash.new
    @positives = Array.new
    @negatives = Array.new
    @called_count = 0
  end

  def add(input_string)
    increase_called_count
    return 0 if input_string.strip.empty?
    map_numbers(input_string)
    get_negatives
    @positives.sum
  end

  def increase_called_count
    @called_count = @called_count + 1
  end

  def get_negatives
    raise ArgumentError, "A negative number cannot be sent in the string." if @negatives.count == 1
    raise ArgumentError, "Multiple negative numbers have been detected: #{@negatives.join(',')}" if @negatives.count > 1
    @negatives
  end

  private
  # def map_numbers(string)
  #   @numbers = string.split(REGEX).map do |number|
  #     number.to_i < LIMIT ? number.to_i : 0
  #   end.group_by { |n| n.negative? ? :negative : :positive }
  #
  #   @positives, @negatives = @numbers[:positive].to_a, @numbers[:negative].to_a
  # end

  def numbers(string)
    @numbers = numbers_in_string(string)
  end

  def numbers_in_string(string)
    string.split(REGEX).map do |number|
      number.to_i < LIMIT ? number.to_i : 0
    end
  end

  def map_numbers(string)
    grouped_numbers = numbers(string).group_by { |n| n.negative? ? :negative : :positive }
    @positives, @negatives = grouped_numbers[:positive].to_a, grouped_numbers[:negative].to_a
  end
end