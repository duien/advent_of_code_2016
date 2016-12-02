defmodule AdventOfCode do

  defmodule Position do
    defstruct x: 0, y: 0, facing: :north

    def turn(position, "R"), do: %{ position | facing: right_of(position.facing) }
    def turn(position, "L"), do: %{ position | facing: left_of(position.facing) }

    def forward(position, distance) do
      case position.facing do
        :north -> %{ position | y: position.y + distance }
        :south -> %{ position | y: position.y - distance }
        :east  -> %{ position | x: position.x + distance }
        :west  -> %{ position | x: position.x - distance }
      end
    end

    defp left_of(:north), do: :west
    defp left_of(:south), do: :east
    defp left_of(:east),  do: :north
    defp left_of(:west),  do: :south

    defp right_of(:north), do: :east
    defp right_of(:south), do: :west
    defp right_of(:east),  do: :south
    defp right_of(:west),  do: :north
  end

  def taxi(route) do
    end_position = %Position{}
    |> follow_directions(String.split(route, ", "))

    abs(end_position.x) + abs(end_position.y)
  end

  defp follow_directions(position, [direction]) do
    position
    |> shift(direction)
  end
  defp follow_directions(position, [direction | directions]) do
    position
    |> shift(direction)
    |> follow_directions(directions)
  end

  defp shift(position, segment) do
    regex = ~r/(?<direction>R|L)(?<distance>\d+)/
    [direction, distance] = Regex.run(regex, segment, capture: :all_but_first)
    distance = String.to_integer(distance)

    position
    |> Position.turn(direction)
    |> Position.forward(distance)
  end


end
