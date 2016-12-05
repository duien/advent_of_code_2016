defmodule AdventOfCode.Password do
  def generate(door_id) do
    hash_stream(door_id)
    |> Enum.take(8)
    |> Enum.map(&String.slice(&1, 5, 1))
    |> Enum.map(&String.downcase(&1))
    |> Enum.join
  end

  def generate_complex(door_id) do
    code = [nil, nil, nil, nil, nil, nil, nil, nil]

    hash_stream(door_id)
    |> populate_code(code)
    # |> Enum.take_while()
    |> Enum.join
  end

  def populate_code(stream, code) do
    if Enum.all?(code) do
      code
    else
      [next] = Enum.take(stream, 1)
      IO.inspect({next, code})
      position = String.slice(next, 5, 1)
      value = String.slice(next, 6, 1)

      if position in ~w|0 1 2 3 4 5 6 7| and is_nil(Enum.at(code, String.to_integer(position))) do
        populate_code(Stream.drop(stream, 1), List.replace_at(code, String.to_integer(position), value))
      else
        populate_code(Stream.drop(stream, 1), code)
      end
    end
  end

  defp hash_stream(door_id) do
    Stream.iterate(0, &(&1 + 1))
    |> Stream.map(fn idx -> "#{door_id}#{idx}" end)
    |> Stream.map(fn input -> :crypto.hash(:md5, input) |> Base.encode16 end)
    |> Stream.filter(fn hash -> String.starts_with?(hash, "00000") end)
  end

  def talky_hash_stream(door_id) do
    Stream.iterate(0, &(&1 + 1))
    |> Stream.map(fn idx -> {idx, "#{door_id}#{idx}"} end)
    |> Stream.map(fn {idx, input} -> {idx, Base.encode16(:crypto.hash(:md5, input)) } end)
    |> Stream.filter(fn {idx, hash} -> String.starts_with?(hash, "00000") end)
  end
end
