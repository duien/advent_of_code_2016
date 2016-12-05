defmodule AdventOfCode.Room do

  @room_regex ~r|(?<name>([a-z]+-)+)(?<sector>\d+)\[(?<checksum>[a-z]{5})\]|
  def real?(room) do
    extract = Regex.named_captures(@room_regex, room)
    IO.inspect(extract)
    %{"name" => name, "sector" => sector, "checksum" => checksum } = extract
    checksum == generate_checksum(name)
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
