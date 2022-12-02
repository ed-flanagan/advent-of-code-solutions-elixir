defmodule Advent.Y2015.D01Test do
  use ExUnit.Case, async: true

  import TestHelper
  import Advent.Y2015.D01

  describe "part_one/1" do
    test "solves example input" do
      examples = [
        {'(())', 0},
        {'()()', 0},
        {'(((', 3},
        {'(()(()(', 3},
        {'))(((((', 3},
        {'())', -1},
        {'))(', -1},
        {')))', -3},
        {')())())', -3}
      ]

      Enum.each(examples, fn {input, expected} ->
        assert part_one(input) == expected
      end)
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input!()) == 138
    end
  end

  describe "part_two/1" do
    test "solves example input" do
      examples = [
        {')', 1},
        {'()())', 5}
      ]

      Enum.each(examples, fn {input, expected} ->
        assert part_two(input) == expected
      end)
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input!()) == 1771
    end
  end

  defp puzzle_input! do
    puzzle_input()
    |> Enum.take(1)
    |> List.first()
    |> to_charlist
  end
end
