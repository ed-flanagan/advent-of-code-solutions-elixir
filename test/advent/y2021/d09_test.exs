defmodule Advent.Y2021.D09Test do
  use ExUnit.Case, async: true

  import Advent.Y2021.D09
  import TestHelper

  @example_input [
    "2199943210",
    "3987894921",
    "9856789892",
    "8767896789",
    "9899965678"
  ]

  describe "part_one" do
    test "solves example input" do
      assert part_one(@example_input) == 15
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input()) == 444
    end
  end

  describe "part_two" do
    test "solves example input" do
      assert part_two(@example_input) == 1134
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input()) == 1_168_440
    end
  end
end
