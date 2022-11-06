class RomanNumeral
  ROMAN_NUMERALS = {
    1 => 'I',
    4 => 'IV',
    5 => 'V',
    9 => 'IX',
    10 => 'X',
    40 => 'XL',
    50 => 'L',
    90 => 'XC',
    100 => 'C',
    400 => 'CD',
    500 => 'D',
    900 => 'CM',
    1000 => 'M'
  }

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_numeral = ''
    num = number
    until num == 0
      roman_numeral_value = ROMAN_NUMERALS.keys.select do |value|
        num / value > 0
      end.max

      repeats, num = num.divmod(roman_numeral_value)
      roman_numeral += ROMAN_NUMERALS[roman_numeral_value] * repeats
    end

    p roman_numeral
  end
end
