defmodule Advent.Y2015.D04Test do
  use ExUnit.Case, async: true

  import Advent.Y2015.D04

  describe "part_one/2" do
    test "solves example input" do
      [
        {"abcdef", 609_043},
        {"pqrstuv", 1_048_970}
      ]
      |> Enum.each(fn {input, expected} ->
        assert part_one(input, 1_200_000) == expected
      end)
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input(), 150_000) == 117_946
    end

    test "limit works" do
      assert part_one("deadbeef", 5) == :error
    end
  end

  describe "part_two/2" do
    test "solves puzzle input" do
      assert part_two(puzzle_input(), 4_000_000) == 3_938_038
    end

    test "limit works" do
      assert part_two("deadbeef", 5) == :error
    end
  end

  defp puzzle_input do
    "ckczppom"
  end
end
