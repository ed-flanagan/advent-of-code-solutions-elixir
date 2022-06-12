defmodule Advent.Y2021.D01Test do
  use ExUnit.Case, async: true

  alias Advent.Y2021.D01

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
      assert D01.part_one(@example_input) == 7
    end

    test "solves puzzle input" do
      assert D01.part_one(puzzle_input!()) == 1226
    end
  end

  describe "part_two" do
    test "solves example input" do
      assert D01.part_two(@example_input) == 5
    end

    test "solves puzzle input" do
      assert D01.part_two(puzzle_input!()) == 1252
    end
  end

  @spec puzzle_input!() :: Enumerable.t()
  def puzzle_input! do
    Path.join([__DIR__, "support", "d01_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
  end
end
