defmodule Advent.Y2021.D01Test do
  use ExUnit.Case, async: true

  import Advent.Y2021.D01
  import TestHelper

  @example_input [
    199,
    200,
    208,
    210,
    200,
    207,
    240,
    269,
    260,
    263
  ]

  describe "part_one" do
    test "solves example input" do
      assert part_one(@example_input) == 7
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input!()) == 1226
    end
  end

  describe "part_two" do
    test "solves example input" do
      assert part_two(@example_input) == 5
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input!()) == 1252
    end
  end

  @spec puzzle_input!() :: Enumerable.t()
  def puzzle_input! do
    puzzle_input()
    |> Stream.map(&String.to_integer/1)
  end
end
