defmodule Advent.Y2021.D11Test do
  use ExUnit.Case, async: true

  import Advent.Y2021.D11
  import TestHelper

  @example_input [
    "5483143223",
    "2745854711",
    "5264556173",
    "6141336146",
    "6357385478",
    "4167524645",
    "2176841721",
    "6882881134",
    "4846848554",
    "5283751526"
  ]

  describe "part_one" do
    test "solves example input" do
      assert part_one(@example_input, 100) == 1656
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input(), 100) == 1625
    end
  end

  describe "part_two" do
    test "solves example input" do
      assert part_two(@example_input) == 195
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input()) == 244
    end
  end
end
