defmodule AdventOfCodeTest.RoomTest do
  use ExUnit.Case

  describe "AdventOfCode.Room.real?/1" do
    test "aaaaa-bbb-z-y-x-123[abxyz]" do
      assert AdventOfCode.Room.real?("aaaaa-bbb-z-y-x-123[abxyz]")
    end

    test "a-b-c-d-e-f-g-h-987[abcde]" do
      assert AdventOfCode.Room.real?("a-b-c-d-e-f-g-h-987[abcde]")
    end

    test "not-a-real-room-404[oarel]" do
      assert AdventOfCode.Room.real?("not-a-real-room-404[oarel]")
    end

    test "totally-real-room-200[decoy]" do
      refute AdventOfCode.Room.real?("totally-real-room-200[decoy]")
    end
  end
end
