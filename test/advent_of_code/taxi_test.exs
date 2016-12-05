defmodule AdventOfCodeTest.TaxiTest do
  use ExUnit.Case
  describe "AdventOfCode.Taxi.taxi_distance/1" do
    test "for route R2, L3" do
      route = "R2, L3"
      assert AdventOfCode.Taxi.distance_to_end(route) == 5
    end

    test "for route R2, R2, R2" do
      route = "R2, R2, R2"
      assert AdventOfCode.Taxi.distance_to_end(route) == 2
    end

    test "for route R5, L5, R5, R3" do
      route = "R5, L5, R5, R3"
      assert AdventOfCode.Taxi.distance_to_end(route) == 12
    end
  end

  describe "AdventOfCode.taxi_repeat/1" do
    test "for route R8, R4, R4, R8" do
      route = "R8, R4, R4, R8"
      assert AdventOfCode.Taxi.distance_to_repeat(route) == 4
    end
  end

end
