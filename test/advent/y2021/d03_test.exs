defmodule Advent.Y2021.D03Test do
  use ExUnit.Case, async: true

  import Advent.Y2021.D03
  import TestHelper

  @example_input [
    [0, 0, 1, 0, 0],
    [1, 1, 1, 1, 0],
    [1, 0, 1, 1, 0],
    [1, 0, 1, 1, 1],
    [1, 0, 1, 0, 1],
    [0, 1, 1, 1, 1],
    [0, 0, 1, 1, 1],
    [1, 1, 1, 0, 0],
    [1, 0, 0, 0, 0],
    [1, 1, 0, 0, 1],
    [0, 0, 0, 1, 0],
    [0, 1, 0, 1, 0]
  ]

  describe "part_one" do
    test "solves example input" do
      assert part_one(@example_input) == 198
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input!()) == 3_242_606
    end
  end

  describe "part_two" do
    test "solves example input" do
      assert part_two(@example_input) == 230
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input!()) == 4_856_080
    end
  end

  @spec puzzle_input!() :: Enumerable.t()
  def puzzle_input! do
    puzzle_input()
    |> Stream.map(&String.to_charlist/1)
    |> Stream.map(fn bits ->
      Enum.map(bits, fn
        ?1 -> 1
        ?0 -> 0
      end)
    end)
  end
end
