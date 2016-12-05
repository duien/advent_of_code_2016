defmodule AdventOfCodeTest.PasswordTest do
  use ExUnit.Case

  describe "AdventOfCode.Password.generate/1" do
    test "generates password from 'abc'" do
      assert AdventOfCode.Password.generate("abc") == "18f47a30"
    end
  end

  test "can generate a hash" do
    input = "abc3231929"
    hashed = :crypto.hash(:md5, input) |> Base.encode16
    assert String.starts_with?(hashed, "000001")
  end
end
