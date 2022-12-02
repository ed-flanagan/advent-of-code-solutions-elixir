defmodule Advent.Y2017.D01Test do
  use ExUnit.Case, async: true

  import TestHelper
  import Advent.Y2017.D01

  describe "part_one/1" do
    test "solves example input" do
      [
        {"1122", 3},
        {"1111", 4},
        {"1234", 0},
        {"91212129", 9},
        {"112231", 4}
      ]
      |> Enum.each(fn {input, expected} ->
        assert part_one(input) == expected
      end)
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input!()) == 1216
    end
  end

  describe "part_two/1" do
    test "solve example input" do
      [
        {"1212", 6},
        {"1221", 0},
        {"123425", 4},
        {"123123", 12},
        {"12131415", 4}
      ]
      |> Enum.each(fn {input, expected} ->
        assert part_two(input) == expected
      end)
    end

    test "solve puzzle input" do
      assert part_two(puzzle_input!()) == 1072
    end
  end

  defp puzzle_input! do
    puzzle_input()
    |> Enum.take(1)
    |> List.first()
  end
end
