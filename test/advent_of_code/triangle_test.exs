defmodule AdventOfCodeTest.TriangeTest do
  use ExUnit.Case

  describe "AdventOfCode.Triange.possible?\1" do
    test "figures it out" do
      refute AdventOfCode.Triangle.possible?([5, 10, 25])
    end
  end
end
