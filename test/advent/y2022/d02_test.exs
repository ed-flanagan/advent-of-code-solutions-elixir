defmodule Advent.Y2022.D02Test do
  use ExUnit.Case, async: true

  import Advent.Y2022.D02
  import TestHelper

  @example_input [
    "A Y",
    "B X",
    "C Z"
  ]

  describe "part_one" do
    test "solves example input" do
      assert part_one(@example_input) == 15
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input()) == 11_906
    end
  end

  describe "part_two" do
    test "solves example input" do
      assert part_two(@example_input) == 12
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input()) == 11_186
    end
  end
end
