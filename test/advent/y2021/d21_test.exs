defmodule Advent.Y2021.D21Test do
  use ExUnit.Case

  import Advent.Y2021.D21, only: [part_one: 1, part_two: 1]

  @example_input [
    "Player 1 starting position: 4",
    "Player 2 starting position: 8"
  ]

  describe "part_one" do
    test "solves example input" do
      assert part_one(@example_input) == 739_785
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input!()) == 734_820
    end
  end

  describe "part_two" do
    @tag :skip
    test "solves example input" do
      assert part_two(@example_input) == 0
    end

    @tag :skip
    test "solves puzzle input" do
      assert part_two(puzzle_input!()) == 0
    end
  end

  @spec puzzle_input!() :: Enumerable.t()
  defp puzzle_input!() do
    Path.join([__DIR__, "support", "d21_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
