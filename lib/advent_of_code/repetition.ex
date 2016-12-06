defmodule AdventOfCode.Repetition do
  def decipher(input) do
    lines = String.split(input, "\n")
    width = Enum.at(lines, 0) |> String.length

    0..(width - 1)
    |> Enum.map(fn idx ->
      {letter, _} = Enum.map(lines, &String.slice(&1, idx, 1))
      |> Enum.group_by(&(&1))
      |> Enum.map(fn {val, reps} -> {val, Enum.count(reps)} end)
      |> Enum.sort_by(fn {_, count} -> count * -1 end)
      |> Enum.at(0)

      letter
    end)
    |> Enum.join
  end
  
  def decipher_modified(input) do
    lines = String.split(input, "\n")
    width = Enum.at(lines, 0) |> String.length

    0..(width - 1)
    |> Enum.map(fn idx ->
      {letter, _} = Enum.map(lines, &String.slice(&1, idx, 1))
      |> Enum.group_by(&(&1))
      |> Enum.map(fn {val, reps} -> {val, Enum.count(reps)} end)
      |> Enum.sort_by(fn {_, count} -> count end)
      |> Enum.at(0)

      letter
    end)
    |> Enum.join
  end
end
