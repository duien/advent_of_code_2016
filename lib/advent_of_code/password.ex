defmodule AdventOfCode.Password do
  def generate(door_id) do
    Stream.iterate(0, &(&1 + 1))
    |> Stream.map(fn idx -> "#{door_id}#{idx}" end)
    |> Stream.map(fn input -> :crypto.hash(:md5, input) |> Base.encode16 end)
    |> Stream.filter(fn hash -> String.starts_with?(hash, "00000") end)
    |> Enum.take(8)
    |> Enum.map(&String.slice(&1, 5, 1))
    |> Enum.map(&String.downcase(&1))
    |> Enum.join
  end
end
