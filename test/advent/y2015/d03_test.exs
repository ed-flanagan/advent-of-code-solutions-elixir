defmodule Advent.Y2015.D03Test do
  use TestHelper

  describe "part one" do
    test "solves example input" do
      examples = [
        {[">"], 2},
        {["^>v<"], 4},
        {["^v^v^v^v^v"], 2}
      ]

      Enum.each(examples, fn {input, expected} ->
        assert part_one(input) == expected
      end)
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input()) == 2592
    end
  end

  describe "part two" do
    test "solves example input" do
      examples = [
        {["^v"], 3},
        {["^>v<"], 3},
        {["^v^v^v^v^v"], 11}
      ]

      Enum.each(examples, fn {input, expected} ->
        assert part_two(input) == expected
      end)
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input()) == 2360
    end
  end
end
