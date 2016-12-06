defmodule AdventOfCodeTest.RepetitionTest do
  use ExUnit.Case
  
  describe "AdventOfCode.Repetition.decipher/1" do
    test "deciphers test input" do
      input = "eedadn\ndrvtee\neandsr\nraavrd\natevrs\ntsrnev\nsdttsa\nrasrtv\nnssdts\nntnada\nsvetve\ntesnvt\nvntsnd\nvrdear\ndvrsen\nenarar"
      assert AdventOfCode.Repetition.decipher(input) == "easter"
    end
  end
  
  describe "AdventOfCode.Repetition.decipher_modified/1" do
    test "deciphers test input" do
      input = "eedadn\ndrvtee\neandsr\nraavrd\natevrs\ntsrnev\nsdttsa\nrasrtv\nnssdts\nntnada\nsvetve\ntesnvt\nvntsnd\nvrdear\ndvrsen\nenarar"
      assert AdventOfCode.Repetition.decipher_modified(input) == "advent"
    end
  end

end
