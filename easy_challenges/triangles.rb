class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError if !valid?
  end

  def kind
    return 'equilateral' if sides.all? { |side| side == sides[0]}
    return 'isosceles' if sides.count(sides[0]) == 2 || sides.count(sides[1]) == 2
    return 'scalene'
  end

  def valid?
    sides.all? { |side| side > 0 } &&
    sides[0] + sides[1] > sides[2] &&
    sides[0] + sides[2] > sides[1] && 
    sides[1] + sides[2] > sides[0]
  end
end