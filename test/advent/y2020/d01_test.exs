defmodule Advent.Y2020.D01Test do
  use ExUnit.Case, async: true

  import TestHelper
  import Advent.Y2020.D01

  @example_input [1721, 979, 366, 299, 675, 1456]

  describe "part_one/1" do
    test "solves example input" do
      assert part_one(@example_input) == 514_579
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input!()) == 1_006_176
    end
  end

  describe "part_one/2" do
    test "solves example input" do
      assert part_two(@example_input) == 241_861_950
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input!()) == 199_132_160
    end
  end

  @doc """
  Expects file contents to be integer values seperated by a newline, e.g.

  1721
  979
  366
  """
  @spec puzzle_input!() :: Enumerable.t()
  def puzzle_input! do
    puzzle_input()
    |> Stream.map(&String.to_integer/1)
  end
end
