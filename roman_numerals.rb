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
        # output: string of the @value roman numberal
        # rules:
        #   - upper limit for value is 3000 (no error will be raised)
        #   - starting value will be greater than 0
        # algorithm
        #    - split value into each digit separately, skipping zeros
        #    - store split values in an array beginning with largest to smallest
        #       - until digit_exp is 0
        #       - divide the current value by 10^digit_exp
        #       - store remainder in one variable and add the value - remainder to array
        #       - break out of loop if remainder is equal to the current value
        #       - decrement digit_exp by 1
        #    - for each separate digit((s) if followed by 0s) convert to roman numeral
        #       
        #    - return output string

        roman_numeral = ''
        split_digits.each do |num|
            curr_num = num
            until curr_num == 0
                ROMAN_NUMERALS.keys.reverse.each do |value|
                    if value <= curr_num
                        repeats = curr_num / value
                        roman_numeral += ROMAN_NUMERALS[value] * repeats
                    else
                        next
                    end
                    curr_num = curr_num - (value * repeats)
                end
            end
        end

        p roman_numeral
    end

    private

    def split_digits
        split_digits = []
        curr_value = number
        digit_exp = number.to_s.size - 1

        until digit_exp < 0
            remainder = curr_value % (10 ** digit_exp)
            if remainder == curr_value
                split_digits << curr_value
                break
            else
                split_digits << curr_value - remainder
            end

            curr_value = remainder
            digit_exp -= 1
        end
        split_digits
    end
end

roman1 = RomanNumeral.new(1)
roman2 = RomanNumeral.new(2008)

roman1.to_roman
roman2.to_roman