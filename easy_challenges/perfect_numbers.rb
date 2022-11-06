class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 1

    sum_of_factors = factors(number).sum
    if sum_of_factors > number
      'abundant'
    elsif sum_of_factors < number
      'deficient'
    else
      'perfect'
    end
  end

  class << self
    private

    def factors(number)
      factors = []
      1.upto(number - 1) { |factor| factors << factor if number % factor == 0 }
      factors
    end
  end
end
