defmodule Advent.Y2020.D02Test do
  use ExUnit.Case

  alias Advent.Y2020.D02

  @example_input [
    "1-3 a: abcde",
    "1-3 b: cdefg",
    "2-9 c: ccccccccc"
  ]

  describe "part_one/1" do
    test "solves example input" do
      assert 2 == D02.part_one(@example_input)
    end

    test "solves puzzle input" do
      assert 620 == D02.part_one(puzzle_input())
    end
  end

  describe "part_two/1" do
    test "solves example input" do
      assert 1 == D02.part_two(@example_input)
    end

    test "solves puzzle input" do
      assert 727 == D02.part_two(puzzle_input())
    end
  end

  defp puzzle_input() do
    Path.join([__DIR__, "support", "02_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
