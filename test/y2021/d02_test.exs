defmodule Advent.Y2021.D02Test do
  use ExUnit.Case

  alias Advent.Y2021.D02

  @example_input [
    "forward 5",
    "down 5",
    "forward 8",
    "up 3",
    "down 8",
    "forward 2"
  ]

  describe "part_one/1" do
    test "solves example input" do
      assert D02.part_one(@example_input) == 150
    end

    test "solves puzzle input" do
      assert D02.part_one(puzzle_input!()) == 1_804_520
    end
  end

  describe "part_one/2" do
    test "solves example input" do
      assert D02.part_two(@example_input) == 900
    end

    test "solves puzzle input" do
      assert D02.part_two(puzzle_input!()) == 1_971_095_320
    end
  end

  @spec puzzle_input!() :: Enumerable.t()
  def puzzle_input!() do
    Path.join([__DIR__, "support", "d02_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
