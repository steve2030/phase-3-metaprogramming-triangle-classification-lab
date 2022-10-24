class Triangle
  # write code here
   attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    sorted = [@side1, @side2, @side3].sort
    greatest_side = sorted.pop

    if sorted.any? { |side| side <= 0 }
      raise TriangleError, "Each side must be greater than zero"
    end

    if greatest_side >= sorted.sum
      raise TriangleError, "Does not satisfy the rule of triangle inequality"
    end

    sides = [@side1, @side2, @side3]
    if sides.uniq.count == 1
      :equilateral
    elsif sides.uniq.count == 2
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
  end
end

