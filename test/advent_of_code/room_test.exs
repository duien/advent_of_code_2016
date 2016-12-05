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

  describe "AdventOfCode.Room.decipher/1" do
    test "qzmt-zixmtkozy-ivhz-343[zimth]" do
      assert AdventOfCode.Room.decipher("qzmt-zixmtkozy-ivhz-343[zimth]") == "very encrypted name"
    end
  end

  describe "AdventOfCode.Room.sum_sectors/1" do
    test "does the thing" do
      input = "aaaaa-bbb-z-y-x-123[abxyz]\na-b-c-d-e-f-g-h-987[abcde]\nnot-a-real-room-404[oarel]\ntotally-real-room-200[decoy]"
      assert AdventOfCode.Room.sum_sectors(input) == 1514
    end
  end
end
