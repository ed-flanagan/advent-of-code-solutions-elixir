defmodule Advent.Y2015.D02Test do
  use ExUnit.Case

  alias Advent.Y2015.D02
  import D02, only: [part_one: 1, part_two: 1]

  describe "part_one/1" do
    test "solves example input" do
      examples = [
        {["4x3x2"], 58},
        {["1x10x1"], 43},
        {["2x3x4", "1x1x10"], 101}
      ]

      Enum.each(examples, fn {input, expected} ->
        assert expected == part_one(input)
      end)
    end

    test "solves puzzle input" do
      assert 1_598_415 == part_one(puzzle_input!())
    end
  end

  describe "part_two/1" do
    test "solves example input" do
      examples = [
        {["4x3x2"], 34},
        {["1x10x1"], 14},
        {["2x3x4", "1x1x10"], 48}
      ]

      Enum.each(examples, fn {input, expected} ->
        assert expected == part_two(input)
      end)
    end

    test "solves puzzle input" do
      assert 3812909 == part_two(puzzle_input!())
    end
  end

  defp puzzle_input!() do
    Path.join([__DIR__, "support", "02_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
