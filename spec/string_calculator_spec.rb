require 'string_calculator'

describe StringCalculator do

  subject { described_class.new }

  it "returns zero when the string is empty" do
    expect(subject.add("")).to eq(0)
  end

  it "returns the same number when is one number" do
    expect(subject.add("1")).to eq(1)
    expect(subject.add("5")).to eq(5)
    expect(subject.add("312")).to eq(312)
  end

  it "returns the sum of two number separated by a comma" do
    expect(subject.add("1,2")).to eq(3)
    expect(subject.add("1,3")).to eq(4)
    expect(subject.add("1,0")).to eq(1)
  end

  it "returns the sum of an unknown amount of numbers" do
    expect(subject.add("1,2,3,4,5,6,7,8,9,10")).to eq(55)
    expect(subject.add("22,23,1,0,0")).to eq(46)
    expect(subject.add("1,2,3,4,5")).to eq(15)
  end

  it "returns the sum of two number separated by a new line" do
    expect(subject.add("1\n2,3")).to eq(6)
    expect(subject.add("1\n3,4")).to eq(8)
    expect(subject.add("1,3\n4")).to eq(8)
  end

  it "contains comma delimiters at the beginning, in the middle or the end of the string" do
    expect(subject.add(",1,2,")).to eq(3)
    expect(subject.add(",4,2,")).to eq(6)
    expect(subject.add(",1,2,3,")).to eq(6)
  end

  it "returns the sum with delimiters, different of the comma, at the beginning, in the middle or the end of the string" do
    expect(subject.add("//;\n1;2")).to eq(3)
    expect(subject.add("//;$\n1!;2,3")).to eq(6)
  end

  it "raises ArgumentError when a negative number is sent in the string" do
    expect { subject.add("-1") }.to raise_error(ArgumentError, "A negative number cannot be sent in the string.")
  end

  it "raises ArgumentError when a negative number is sent in the string" do
    expect { subject.add("-1,-2,-3") }.to raise_error(ArgumentError, "Multiple negative numbers have been detected: -1,-2,-3")
  end

  it "returns the number of calls made to the add method" do
    subject.add("//;\n1;2")
    expect(subject.called_count).to eq(1)
    subject.add("//;\n1;2")
    expect(subject.called_count).to eq(2)
  end

  it "omits numbers bigger than a 1000" do
    expect(subject.add("2,1001")).to eq(2)
  end

  it "returns the sum of the numbers no matter the length of the delimiters" do
    expect(subject.add("//[***]\n1***2***3")).to eq(6)
  end
end

