defmodule Advent.Y2020.D02Test do
  use ExUnit.Case, async: true

  import TestHelper
  import Advent.Y2020.D02

  @example_input [
    "1-3 a: abcde",
    "1-3 b: cdefg",
    "2-9 c: ccccccccc"
  ]

  describe "part_one/1" do
    test "solves example input" do
      assert part_one(@example_input) == 2
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input()) == 620
    end
  end

  describe "part_two/1" do
    test "solves example input" do
      assert part_two(@example_input) == 1
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input()) == 727
    end
  end
end
