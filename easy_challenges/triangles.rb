class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError if !valid?
  end

  def kind
    return 'equilateral' if sides.all? { |side| side == sides[0] }
    return 'isosceles' if sides.uniq.size == 2
    'scalene'
  end

  def valid?
    return false if sides.min < 0
    sides[0] + sides[1] > sides[2] &&
      sides[0] + sides[2] > sides[1] &&
      sides[1] + sides[2] > sides[0]
  end
end
