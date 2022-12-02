defmodule Advent.Y2020.D06Test do
  use ExUnit.Case, async: true

  import Advent.Y2020.D06
  import TestHelper

  @example [
    "abc",
    "",
    "a",
    "b",
    "c",
    "",
    "ab",
    "ac",
    "",
    "a",
    "a",
    "a",
    "a",
    "",
    "b"
  ]

  describe "part_one/1" do
    test "solves example input" do
      assert part_one(@example) == 11
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input()) == 6430
    end
  end

  describe "part_two/1" do
    test "solves example input" do
      assert part_two(@example) == 6
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input()) == 3125
    end
  end
end
