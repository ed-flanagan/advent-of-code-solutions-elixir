defmodule Advent.Y2021.D04Test do
  use ExUnit.Case

  import Advent.Y2021.D04, only: [part_one: 1, part_two: 1]

  @example_input [
    "7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1",
    "",
    "22 13 17 11  0",
    "8  2 23  4 24",
    "21  9 14 16  7",
    "6 10  3 18  5",
    "1 12 20 15 19",
    "",
    "3 15  0  2 22",
    "9 18 13 17  5",
    "19  8  7 25 23",
    "20 11 10 24  4",
    "14 21 16 12  6",
    "",
    "14 21 17 24  4",
    "10 16 15  9 19",
    "18  8 23 26 20",
    "22 11 13  6  5",
    "2  0 12  3  7"
  ]

  describe "part_one/1" do
    test "solves example input" do
      assert part_one(@example_input) == 4512
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input!()) == 38_594
    end
  end

  describe "part_one/2" do
    test "solves example input" do
      assert part_two(@example_input) == 1924
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input!()) == 21_184
    end
  end

  @spec puzzle_input!() :: Enumerable.t()
  defp puzzle_input!() do
    Path.join([__DIR__, "support", "d04_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
