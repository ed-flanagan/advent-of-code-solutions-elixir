defmodule Advent.Y2020.D16Test do
  use ExUnit.Case, async: true

  alias Advent.Y2020.D16

  @example_input """
  class: 1-3 or 5-7
  row: 6-11 or 33-44
  seat: 13-40 or 45-50

  your ticket:
  7,1,14

  nearby tickets:
  7,3,47
  40,4,50
  55,2,20
  38,6,12
  """

  describe "part_one/1" do
    test "solves example input" do
      assert D16.part_one(@example_input) == 71
    end

    test "solves puzzle input" do
      assert D16.part_one(puzzle_input!()) == 28_884
    end
  end

  describe "part_two/1" do
    @tag :skip
    test "solves example input" do
      assert D16.part_two(@example_input) == 0
    end

    @tag :skip
    test "solves puzzle input" do
      assert D16.part_two(puzzle_input!()) == 0
    end
  end

  defp puzzle_input!() do
    [__DIR__, "support", "d16_input.txt"]
    |> Path.join()
    |> File.read!()
  end
end
