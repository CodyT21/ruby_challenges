class Octal
  attr_reader :number

  def initialize(str)
    @number = str
  end

  def to_decimal
    return 0 unless valid_octal?

    octal_decimal = 0
    digits = []

    number.each_char { |digit| digits << digit.to_i }
    digits.reverse.each_with_index do |digit, index|
      octal_decimal += digit * (8**index)
    end

    octal_decimal
  end

  private

  def valid_octal?
    number.chars.all? { |char| char =~ /[0-7]/ }
  end
end
