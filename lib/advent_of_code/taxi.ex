defmodule AdventOfCode.Taxi do

  defmodule Position do
    defstruct x: 0, y: 0, facing: :north

    def turn(position, "R"), do: %{ position | facing: right_of(position.facing) }
    def turn(position, "L"), do: %{ position | facing: left_of(position.facing) }
    def turn(position, "S"), do: position

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

  def distance_to_end(route) do
    route
    |> split_segments
    |> follow
    |> distance
  end

  def distance_to_repeat(route) do
    route
    |> split_segments
    |> first_repeat
    |> distance
  end

  defp first_repeat([segment | directions], position \\ %Position{}, visited \\ []) do
    if Enum.find(visited, fn p -> p.x == position.x && p.y == position.y end) do
      position
    else
      {direction, distance} = translate_segment(segment)
      case distance do
        1 -> first_repeat(directions, shift(position, segment), [position|visited])
        _ -> first_repeat(["S#{distance-1}"|directions], shift(position, {direction, 1}), [position|visited])
      end
    end
  end

  defp split_segments(route), do: String.split(route, ", ")
  defp distance(to = %Position{}), do: abs(to.x) + abs(to.y)

  defp follow(directions, position \\ %Position{})
  defp follow([segment], position), do: shift(position, segment)
  defp follow([segment | directions], position), do: follow(directions, shift(position, segment))

  @segment_regexp  ~r/(?<direction>[RLS])(?<distance>\d+)/
  defp translate_segment(segment) do
    [direction, distance] = Regex.run(@segment_regexp, segment, capture: :all_but_first)
    distance = String.to_integer(distance)
    { direction, distance }
  end

  defp shift(position, {direction, distance}) do
    position
    |> Position.turn(direction)
    |> Position.forward(distance)
  end
  defp shift(position, segment), do: shift(position, translate_segment(segment))

end
