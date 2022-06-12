defmodule Advent.Y2020.D06Test do
  use ExUnit.Case, async: true

  alias Advent.Y2020.D06
  import D06, only: [part_one: 1, part_two: 1]

  @example [
    "abc",
    "",
    "a",
    "b",
    "c",
    "",
    "ab",
    "ac",
    "",
    "a",
    "a",
    "a",
    "a",
    "",
    "b"
  ]

  describe "part_one/1" do
    test "solves example input" do
      assert 11 == part_one(@example)
    end

    test "solves puzzle input" do
      assert 6430 == part_one(puzzle_input!())
    end
  end

  describe "part_two/1" do
    test "solves example input" do
      assert 6 == part_two(@example)
    end

    test "solves puzzle input" do
      assert 3125 == part_two(puzzle_input!())
    end
  end

  defp puzzle_input!() do
    Path.join([__DIR__, "support", "d06_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
