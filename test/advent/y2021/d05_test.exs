defmodule Advent.Y2021.D05Test do
  use ExUnit.Case, async: true

  import Advent.Y2021.D05, only: [part_one: 1, part_two: 1]

  @example_input [
    "0,9 -> 5,9",
    "8,0 -> 0,8",
    "9,4 -> 3,4",
    "2,2 -> 2,1",
    "7,0 -> 7,4",
    "6,4 -> 2,0",
    "0,9 -> 2,9",
    "3,4 -> 1,4",
    "0,0 -> 8,8",
    "5,5 -> 8,2"
  ]

  describe "part_one" do
    test "solves example input" do
      assert part_one(@example_input) == 5
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input!()) == 5608
    end
  end

  describe "part_two" do
    test "solves example input" do
      assert part_two(@example_input) == 12
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input!()) == 20_299
    end
  end

  @spec puzzle_input!() :: Enumerable.t()
  defp puzzle_input! do
    Path.join([__DIR__, "support", "d05_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
