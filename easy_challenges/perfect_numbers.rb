class PerfectNumber
    def self.classify(number)
        raise StandardError if number < 1

        factors = []
        1.upto(number - 1) { |factor| factors << factor if number % factor == 0 }
        sum_of_factors = factors.sum

        if sum_of_factors > number
            'abundant'
        elsif sum_of_factors < number
            'deficient'
        else
            'perfect'
        end
    end
end