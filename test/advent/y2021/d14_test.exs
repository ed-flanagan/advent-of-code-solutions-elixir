defmodule Advent.Y2021.D14Test do
  use ExUnit.Case

  import Advent.Y2021.D14, only: [part_one: 1, part_two: 1]

  @example_input [
    "NNCB",
    "",
    "CH -> B",
    "HH -> N",
    "CB -> H",
    "NH -> C",
    "HB -> C",
    "HC -> B",
    "HN -> C",
    "NN -> C",
    "BH -> H",
    "NC -> B",
    "NB -> B",
    "BN -> B",
    "BB -> N",
    "BC -> B",
    "CC -> N",
    "CN -> C"
  ]

  describe "part_one" do
    test "solves example input" do
      assert part_one(@example_input) == 1588
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input!()) == 2602
    end
  end

  describe "part_two" do
    test "solves example input" do
      assert part_two(@example_input) == 2_188_189_693_529
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input!()) == 2_942_885_922_173
    end
  end

  @spec puzzle_input!() :: Enumerable.t()
  defp puzzle_input!() do
    Path.join([__DIR__, "support", "d14_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
