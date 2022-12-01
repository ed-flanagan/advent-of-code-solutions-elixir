defmodule Advent.Y2022.D01Test do
  use ExUnit.Case, async: true

  import Advent.Y2022.D01, only: [part_one: 1, part_two: 1]

  @example_input [
    "1000",
    "2000",
    "3000",
    "",
    "4000",
    "",
    "5000",
    "6000",
    "",
    "7000",
    "8000",
    "9000",
    "",
    "10000"
  ]

  describe "part_one" do
    test "solves example input" do
      assert part_one(@example_input) == 24_000
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input!()) == 71_023
    end
  end

  describe "part_two" do
    test "solves example input" do
      assert part_two(@example_input) == 45_000
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input!()) == 206_289
    end
  end

  @spec puzzle_input!() :: Enumerable.t()
  defp puzzle_input! do
    Path.join([__DIR__, "support", "d01_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
