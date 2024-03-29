defmodule Advent.Y2021.D07Test do
  use TestHelper

  @example_input [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]

  describe "part_one" do
    test "solves example input" do
      assert part_one(@example_input) == 37
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input!()) == 347_509
    end
  end

  describe "part_two" do
    test "solves example input" do
      assert part_two(@example_input) == 168
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input!()) == 98_257_206
    end
  end

  @spec puzzle_input!() :: Enumerable.t()
  defp puzzle_input! do
    puzzle_input()
    |> Enum.at(0)
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end
end
