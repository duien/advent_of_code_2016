defmodule AdventOfCodeTest do
  use ExUnit.Case
  doctest AdventOfCode

  # test "the truth" do
  #   assert 1 + 1 == 2
  # end

  describe "AdventOfCode.tax1/1" do
    test "for route R2, L3" do
      route = "R2, L3"
      assert AdventOfCode.taxi(route) == 5
    end

    test "for route R2, R2, R2" do
      route = "R2, R2, R2"
      assert AdventOfCode.taxi(route) == 2
    end

    test "for route R5, L5, R5, R3" do
      route = "R5, L5, R5, R3"
      assert AdventOfCode.taxi(route) == 12
    end
  end
end
