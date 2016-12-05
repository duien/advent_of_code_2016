defmodule AdventOfCode.Triangle do
  def possible?(sides) do
    Enum.sum(sides) > Enum.max(sides) * 2
  end

  def count_possible(input) do
    numbers = input
    |> String.split("\n")
    |> Enum.map(fn (line) ->
      line
      |> String.split
      |> Enum.map(&String.to_integer(&1))
    end)

    trianges = Enum.map(numbers, &Enum.at(&1, 0)) ++
      Enum.map(numbers, &Enum.at(&1, 1)) ++
      Enum.map(numbers, &Enum.at(&1, 2))

    Enum.chunk(trianges, 3)
    |> Enum.count(&possible?(&1))
  end
end

