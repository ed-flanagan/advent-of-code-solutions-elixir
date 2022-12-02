defmodule Advent.Y2020.D10Test do
  use TestHelper

  describe "part_one/1" do
    test "solves example input" do
      examples = [
        {35, ~w(16 10 15 5 1 11 7 19 6 12 4)},
        {220,
         ~w(28 33 18 42 31 14 46 20 48 47 24 23 49 45 19 38 39 11 1 32 25 35 8 17 7 9 4 2 34 10 3)}
      ]

      Enum.each(examples, fn {expected, input} ->
        assert part_one(input) == expected
      end)
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input()) == 2312
    end
  end

  describe "part_two/1" do
    @tag :skip
    test "solves example input" do
      examples = [
        {8, ~w(16 10 15 5 1 11 7 19 6 12 4)},
        {19_208,
         ~w(28 33 18 42 31 14 46 20 48 47 24 23 49 45 19 38 39 11 1 32 25 35 8 17 7 9 4 2 34 10 3)}
      ]

      Enum.each(examples, fn {expected, input} ->
        assert part_two(input) == expected
      end)
    end
  end
end
