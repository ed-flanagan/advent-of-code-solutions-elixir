defmodule Advent.Y2021.D06Test do
  use ExUnit.Case, async: true

  import Advent.Y2021.D06, only: [part_one: 2, part_two: 2]

  @example_input [3, 4, 3, 1, 2]

  describe "part_one" do
    test "solves example input" do
      assert part_one(@example_input, 18) == 26
      assert part_one(@example_input, 80) == 5934
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input!(), 80) == 360_761
    end
  end

  describe "part_two" do
    test "solves example input" do
      assert part_two(@example_input, 256) == 26_984_457_539
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input!(), 256) == 1_632_779_838_045
    end
  end

  @spec puzzle_input!() :: Enumerable.t()
  defp puzzle_input!() do
    Path.join([__DIR__, "support", "d06_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Enum.at(0)
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end
end
