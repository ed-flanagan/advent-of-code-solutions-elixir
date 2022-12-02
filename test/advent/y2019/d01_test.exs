defmodule Advent.Y2019.D01Test do
  use ExUnit.Case, async: true

  import TestHelper
  import Advent.Y2019.D01

  @example_input [12, 14, 1969, 100_756]

  describe "part_one/1" do
    test "solves example input" do
      assert part_one(@example_input) == 34_241
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input!()) == 3_454_026
    end
  end

  describe "part_one/2" do
    test "solves example input" do
      assert part_two(@example_input) == 51_316
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input!()) == 5_178_170
    end
  end

  @spec puzzle_input!() :: Enumerable.t()
  def puzzle_input! do
    puzzle_input()
    |> Stream.map(&String.to_integer/1)
  end
end
