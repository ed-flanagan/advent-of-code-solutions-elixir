defmodule Advent.Y2016.D01Test do
  use ExUnit.Case, async: true

  alias Advent.Y2016.D01

  describe "part_one/1" do
    test "solves example input" do
      [
        {"R2, L3", 5},
        {"R2, R2, R2", 2},
        {"R5, L5, R5, R3", 12}
      ]
      |> Enum.each(fn {input, expected} ->
        assert D01.part_one(input) == expected
      end)
    end

    test "solves puzzle input" do
      assert D01.part_one(puzzle_input!()) == 243
    end
  end

  describe "part_two/1" do
    test "solves example input" do
      [
        {"R8, R4, R4, R8", 4}
      ]
      |> Enum.each(fn {input, expected} ->
        assert D01.part_two(input) == expected
      end)
    end

    test "solves puzzle input" do
      assert D01.part_two(puzzle_input!()) == 142
    end
  end

  @spec puzzle_input!() :: String.t()
  defp puzzle_input! do
    Path.join([__DIR__, "support", "d01_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Enum.at(0)
  end
end
