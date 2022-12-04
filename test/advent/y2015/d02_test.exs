defmodule Advent.Y2015.D02Test do
  use TestHelper

  describe "part one" do
    test "solves example input" do
      examples = [
        {["4x3x2"], 58},
        {["1x10x1"], 43},
        {["2x3x4", "1x1x10"], 101}
      ]

      Enum.each(examples, fn {input, expected} ->
        assert part_one(input) == expected
      end)
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input()) == 1_598_415
    end
  end

  describe "part two" do
    test "solves example input" do
      examples = [
        {["4x3x2"], 34},
        {["1x10x1"], 14},
        {["2x3x4", "1x1x10"], 48}
      ]

      Enum.each(examples, fn {input, expected} ->
        assert part_two(input) == expected
      end)
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input()) == 3_812_909
    end
  end
end
