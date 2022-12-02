defmodule Advent.Y2015.D05Test do
  use ExUnit.Case, async: true

  import TestHelper
  import Advent.Y2015.D05

  describe "part_one/1" do
    test "solves example input" do
      example = [
        # nice
        "ugknbfddgicrmopn",
        # nice
        "aaa",
        # naughty
        "jchzalrnumimnmhp",
        # naughty
        "haegwjzuvuyypxyu",
        # naughty
        "dvszwmarrgswjxmb"
      ]

      assert part_one(example) == 2
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input()) == 236
    end
  end

  describe "part_two/1" do
    test "solves example input" do
      example = [
        # naughty
        "aaa",
        # nice
        "qjhvhtzxzqqjkmpb",
        # nice
        "xxyxx",
        # naughty
        "uurcxstgmygtbstg",
        # naughty
        "ieodomkazucvgmuy",
        # nice
        "rxexcbwhiywwwwnu"
      ]

      assert part_two(example) == 3
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input()) == 51
    end
  end
end
