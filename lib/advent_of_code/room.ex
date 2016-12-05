defmodule AdventOfCode.Room do
  # defstruct name: nil, checksum: nil, sector

  @room_regex ~r|(?<name>([a-z]+-)+)(?<sector>\d+)\[(?<checksum>[a-z]{5})\]|
  @alphabet String.graphemes("abcdefghijklmnopqrstuvwxyz")

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

  def print_valid_rooms(rooms) do
    rooms
    |> String.split("\n")
    |> Enum.filter(&real?(&1))
    |> Enum.find(&(decipher(&1) == "northpole object storage"))
    |> sector
  end

  def decipher(room) do
    %{"name" => name, "sector" => sector} = extract(room)
    sector = String.to_integer(sector)

    name
    |> String.graphemes
    |> Enum.map(fn l ->
      case l do
        "-" -> " "
        l when l in @alphabet ->
          index = Enum.find_index(@alphabet, &(&1 == l))
          new_index = rem(index + sector, Enum.count(@alphabet))
          Enum.at(@alphabet, new_index)
      end
    end)
    |> Enum.join
    |> String.trim
  end

  defp extract(room) do
    Regex.named_captures(@room_regex, room)
  end

  defp sector(room) do
    %{"sector" => sector} = extract(room)
    String.to_integer(sector)
  end

  def generate_checksum(name) do
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
