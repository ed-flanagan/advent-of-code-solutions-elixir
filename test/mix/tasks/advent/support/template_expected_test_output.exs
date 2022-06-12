defmodule Advent.Y1970.D01Test do
  use ExUnit.Case, async: true

  import Advent.Y1970.D01, only: [part_one: 1, part_two: 1]

  @example_input []

  describe "part_one" do
    @tag :skip
    test "solves example input" do
      assert part_one(@example_input) == 0
    end

    @tag :skip
    test "solves puzzle input" do
      assert part_one(puzzle_input!()) == 0
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
  defp puzzle_input! do
    Path.join([__DIR__, "support", "d01_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
