defmodule AdventOfCode.Room do

  @room_regex ~r|(?<name>([a-z]+-)+)(?<sector>\d+)\[(?<checksum>[a-z]{5})\]|
  def real?(room) do
    %{"name" => name, "checksum" => checksum } = extract(room)
    checksum == generate_checksum(name)
  end

  def sum_sectors(rooms) do
    rooms
    |> String.split("\n")
    |> Enum.filter(&real?(&1))
    |> Enum.map(&sector(&1))
    |> Enum.sum
  end

  defp extract(room) do
    Regex.named_captures(@room_regex, room)
  end

  defp sector(room) do
    %{"sector" => sector} = extract(room)
    String.to_integer(sector)
  end

  defp generate_checksum(name) do
    String.graphemes(name)
    |> Enum.reject(&(&1 == "-"))
    |> Enum.group_by(fn(l) -> l end)
    |> Enum.map(fn {letter, occurances} -> { letter, Enum.count(occurances)} end)
    |> Enum.sort_by(fn {letter, count} -> [count * -1, letter] end)
    |> Enum.take(5)
    |> Enum.map(fn { letter, _} -> letter end)
    |> Enum.join
  end
end
