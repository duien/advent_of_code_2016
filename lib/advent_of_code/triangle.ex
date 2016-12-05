defmodule AdventOfCode.Triangle do
  def possible?(sides) do
    Enum.sum(sides) > Enum.max(sides) * 2
  end

  def count_possible(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn (line) ->
      line
      |> String.split
      |> Enum.map(&String.to_integer(&1))
    end)
    |> Enum.count(&possible?(&1))
  end
end

