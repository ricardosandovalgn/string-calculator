require 'string_calculator'

describe StringCalculator do

  it "returns zero when the string is empty" do
    calculator = StringCalculator.new
    result = calculator.add("")
    expect(result).to eq(0)
  end

  it "returns the same number when is one number" do
    calculator = StringCalculator.new
    result = calculator.add("1")
    expect(result).to eq(1)
  end

  it "returns the sum of two number separated by a comma" do
    calculator = StringCalculator.new
    result = calculator.add("1,2")
    expect(result).to eq(3)
  end

  it "returns the sum of an unknown amount of numbers" do
    calculator = StringCalculator.new
    result = calculator.add("1,2,3,4,5,6,7,8,9,10")
    expect(result).to eq(55)
  end

  it "returns the sum of two number separated by a new line" do
    calculator = StringCalculator.new
    result = calculator.add("1\n2,3")
    expect(result).to eq(6)
  end

  it "contains comma delimiters at the beginning, in the middle or the end of the string" do
    calculator = StringCalculator.new
    result = calculator.add("//;\n1;2")
    expect(result).to eq(3)
  end

  it "returns the sum of contains delimiters, different of the comma, at the beginning, in the middle or the end of the string" do
    calculator = StringCalculator.new
    result = calculator.add("//;\n1;2")
    expect(result).to eq(3)
  end

end

