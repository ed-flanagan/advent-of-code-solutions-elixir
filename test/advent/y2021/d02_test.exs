defmodule Advent.Y2021.D02Test do
  use ExUnit.Case, async: true

  import Advent.Y2021.D02
  import TestHelper

  @example_input [
    "forward 5",
    "down 5",
    "forward 8",
    "up 3",
    "down 8",
    "forward 2"
  ]

  describe "part_one" do
    test "solves example input" do
      assert part_one(@example_input) == 150
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input()) == 1_804_520
    end
  end

  describe "part_two" do
    test "solves example input" do
      assert part_two(@example_input) == 900
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input()) == 1_971_095_320
    end
  end
end
