defmodule Advent.Y2020.D01Test do
  use ExUnit.Case, async: true

  alias Advent.Y2020.D01

  @example_input [1721, 979, 366, 299, 675, 1456]

  describe "part_one/1" do
    test "solves example input" do
      assert 514_579 == D01.part_one(@example_input)
    end

    test "solves puzzle input" do
      assert 1_006_176 == D01.part_one(puzzle_input!())
    end
  end

  describe "part_one/2" do
    test "solves example input" do
      assert 241_861_950 == D01.part_two(@example_input)
    end

    test "solves puzzle input" do
      assert 199_132_160 == D01.part_two(puzzle_input!())
    end
  end

  @doc """
  Expects file contents to be integer values seperated by a newline, e.g.

  1721
  979
  366
  """
  @spec puzzle_input!() :: Enumerable.t()
  def puzzle_input! do
    Path.join([__DIR__, "support", "d01_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
  end
end
