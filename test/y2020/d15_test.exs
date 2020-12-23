defmodule Advent.Y2020.D15Test do
  use ExUnit.Case

  alias Advent.Y2020.D15
  import D15, only: [part_one: 1, part_two: 1]

  describe "part_one/1" do
    test "solves example input" do
      [
        {436, [0, 3, 6]},
        {1, [1, 3, 2]},
        {10, [2, 1, 3]},
        {27, [1, 2, 3]},
        {78, [2, 3, 1]},
        {438, [3, 2, 1]},
        {1836, [3, 1, 2]}
      ]
      |> Enum.each(fn {expected, input} ->
        assert expected == part_one(input)
      end)
    end

    test "solves puzzle input" do
      assert 319 == part_one(puzzle_input!())
    end
  end

  describe "part_two/1" do
    test "solves example input" do
      [
        # {175594, [0, 3, 6]},
        # {2578, [1, 3, 2]},
        # {3544142, [2, 1, 3]},
        # {261214, [1, 2, 3]},
        # {6895259, [2, 3, 1]},
        # {18, [3, 2, 1]},
        # {362, [3, 1, 2]}
      ]
      |> Enum.each(fn {expected, input} ->
        assert expected == part_two(input)
      end)
    end

    test "solves puzzle input" do
      assert 2424 == part_two(puzzle_input!())
    end
  end

  defp puzzle_input!() do
    [__DIR__, "support", "d15_input.txt"]
    |> Path.join()
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Enum.at(0)
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end
end
