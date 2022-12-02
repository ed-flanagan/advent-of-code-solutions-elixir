defmodule Advent.Y2018.D01Test do
  use ExUnit.Case, async: true

  import TestHelper
  import Advent.Y2018.D01

  describe "part_one/1" do
    test "solves example input" do
      [
        {[1, -2, 3, 1], 3},
        {[1, 1, 1], 3},
        {[1, 1, -2], 0},
        {[-1, -2, -3], -6}
      ]
      |> Enum.each(fn {input, expected} ->
        assert part_one(input) == expected
      end)
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input!()) == 437
    end
  end

  describe "part_one/2" do
    test "solves example input" do
      [
        {[1, -2, 3, 1], 2},
        {[1, -1], 0},
        {[3, 3, 4, -2, -4], 10},
        {[-6, 3, 8, 5, -6], 5},
        {[7, 7, -2, -7, -4], 14}
      ]
      |> Enum.each(fn {input, expected} ->
        assert part_two(input) == expected
      end)
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input!()) == 655
    end
  end

  @spec puzzle_input!() :: Enumerable.t()
  def puzzle_input! do
    puzzle_input()
    |> Stream.map(&String.to_integer/1)
  end
end
