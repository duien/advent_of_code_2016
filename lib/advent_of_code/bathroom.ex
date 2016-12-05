defmodule AdventOfCode.Bathroom do
  # @keypad = [["1", "2", "3"],
  #            ["4", "5", "6"],
  #            ["7", "8", "9"]]
  @start_from "5"

  # Given multi-line string of directions, split the lines and find the code
  def entry_code(instructions) do
    String.split(instructions, "\n")
    |> Enum.reduce([], &navigate(&1, &2))
    |> IO.inspect
    |> Enum.join("")
  end

  # Starting at `from` follow a line of directions to get the final number to press
  def navigate(directions, from \\ []) do
    start_point = case from do
                    [] -> @start_from
                    _  -> List.last(from)
                  end
    num = Enum.reduce(String.graphemes(directions), start_point, &shift(&2, &1))
    from ++ [num]
  end

  #     1
  #   2 3 4
  # 5 6 7 8 9
  #   A B C
  #     D
  defp shift(from, direction)
  defp shift("1", "U"), do: "1"
  defp shift("1", "D"), do: "3"
  defp shift("1", "L"), do: "1"
  defp shift("1", "R"), do: "1"

  defp shift("2", "U"), do: "2"
  defp shift("2", "D"), do: "6"
  defp shift("2", "L"), do: "2"
  defp shift("2", "R"), do: "3"

  defp shift("3", "U"), do: "1"
  defp shift("3", "D"), do: "7"
  defp shift("3", "L"), do: "2"
  defp shift("3", "R"), do: "4"

  defp shift("4", "U"), do: "4"
  defp shift("4", "D"), do: "8"
  defp shift("4", "L"), do: "3"
  defp shift("4", "R"), do: "4"

  defp shift("5", "U"), do: "5"
  defp shift("5", "D"), do: "5"
  defp shift("5", "L"), do: "5"
  defp shift("5", "R"), do: "6"

  defp shift("6", "U"), do: "2"
  defp shift("6", "D"), do: "A"
  defp shift("6", "L"), do: "5"
  defp shift("6", "R"), do: "7"

  defp shift("7", "U"), do: "3"
  defp shift("7", "D"), do: "B"
  defp shift("7", "L"), do: "6"
  defp shift("7", "R"), do: "8"
  #     1
  #   2 3 4
  # 5 6 7 8 9
  #   A B C
  #     D
  defp shift("8", "U"), do: "4"
  defp shift("8", "D"), do: "C"
  defp shift("8", "L"), do: "7"
  defp shift("8", "R"), do: "9"

  defp shift("9", "U"), do: "9"
  defp shift("9", "D"), do: "9"
  defp shift("9", "L"), do: "8"
  defp shift("9", "R"), do: "9"

  defp shift("A", "U"), do: "6"
  defp shift("A", "D"), do: "A"
  defp shift("A", "L"), do: "A"
  defp shift("A", "R"), do: "B"

  defp shift("B", "U"), do: "7"
  defp shift("B", "D"), do: "D"
  defp shift("B", "L"), do: "A"
  defp shift("B", "R"), do: "C"

  defp shift("C", "U"), do: "8"
  defp shift("C", "D"), do: "C"
  defp shift("C", "L"), do: "B"
  defp shift("C", "R"), do: "C"

  defp shift("D", "U"), do: "B"
  defp shift("D", "D"), do: "D"
  defp shift("D", "L"), do: "D"
  defp shift("D", "R"), do: "D"

  # defp shift("1", "U"), do: "1"
  # defp shift("1", "D"), do: "4"
  # defp shift("1", "L"), do: "1"
  # defp shift("1", "R"), do: "2"

  # defp shift("2", "U"), do: "2"
  # defp shift("2", "D"), do: "5"
  # defp shift("2", "L"), do: "1"
  # defp shift("2", "R"), do: "3"

  # defp shift("3", "U"), do: "3"
  # defp shift("3", "D"), do: "6"
  # defp shift("3", "L"), do: "2"
  # defp shift("3", "R"), do: "3"

  # defp shift("4", "U"), do: "1"
  # defp shift("4", "D"), do: "7"
  # defp shift("4", "L"), do: "4"
  # defp shift("4", "R"), do: "5"

  # defp shift("5", "U"), do: "2"
  # defp shift("5", "D"), do: "8"
  # defp shift("5", "L"), do: "4"
  # defp shift("5", "R"), do: "6"

  # defp shift("6", "U"), do: "3"
  # defp shift("6", "D"), do: "9"
  # defp shift("6", "L"), do: "5"
  # defp shift("6", "R"), do: "6"

  # defp shift("7", "U"), do: "4"
  # defp shift("7", "D"), do: "7"
  # defp shift("7", "L"), do: "7"
  # defp shift("7", "R"), do: "8"

  # defp shift("8", "U"), do: "5"
  # defp shift("8", "D"), do: "8"
  # defp shift("8", "L"), do: "7"
  # defp shift("8", "R"), do: "9"

  # defp shift("9", "U"), do: "6"
  # defp shift("9", "D"), do: "9"
  # defp shift("9", "L"), do: "8"
  # defp shift("9", "R"), do: "9"
end
