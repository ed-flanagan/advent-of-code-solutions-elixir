defmodule Advent.Y2020.D05Test do
  use ExUnit.Case, async: true

  import Advent.Y2020.D05
  import TestHelper

  describe "part_one/1" do
    test "solves example input" do
      example = [
        "BFFFBBFRRR",
        "FFFBBBFRRR",
        "BBFFBBFRLL"
      ]

      assert part_one(example) == 820
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input()) == 901
    end
  end

  describe "part_two/1" do
    test "solves puzzle input" do
      assert part_two(puzzle_input()) == 661
    end
  end
end
