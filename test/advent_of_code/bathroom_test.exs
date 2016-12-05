defmodule AdventOfCodeTest.BathroomTest do
  use ExUnit.Case

  describe "AdventOfCode.Bathroom.navigate\1" do
    test "works with a single direction" do
      assert AdventOfCode.Bathroom.navigate("ULL") == ["5"]
    end
  end

  describe "AdventOfCode.Bathroom.entry_code\1" do
    test "works with test data" do
      data = "ULL\nRRDDD\nLURDL\nUUUUD"
      # assert AdventOfCode.Bathroom.entry_code(data) == "1985"
      assert AdventOfCode.Bathroom.entry_code(data) == "5DB3"
    end
  end
end
