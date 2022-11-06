class SumOfMultiples
  attr_reader :number_set

  def initialize(*number_set)
    @number_set = number_set
  end

  def self.to(stop_num)
    new(3, 5).to(stop_num)
  end

  def to(stop_num)
    sum = 0

    (1...stop_num).each do |curr_num|
      sum += curr_num if number_set.any? { |num| curr_num % num == 0 }
    end
    sum
  end
end
