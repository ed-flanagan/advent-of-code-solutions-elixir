defmodule Advent.Y2021.D15Test do
  use ExUnit.Case, async: true

  import Advent.Y2021.D15, only: [part_one: 1, part_two: 1]

  @example_input [
    "1163751742",
    "1381373672",
    "2136511328",
    "3694931569",
    "7463417111",
    "1319128137",
    "1359912421",
    "3125421639",
    "1293138521",
    "2311944581"
  ]

  describe "part_one" do
    test "solves example input" do
      assert part_one(@example_input) == 40
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input!()) == 435
    end
  end

  describe "part_two" do
    test "solves example input" do
      assert part_two(@example_input) == 315
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input!()) == 2842
    end
  end

  @spec puzzle_input!() :: Enumerable.t()
  defp puzzle_input! do
    Path.join([__DIR__, "support", "d15_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
