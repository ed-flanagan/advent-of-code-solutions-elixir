defmodule Advent.Y2020.D08Test do
  use ExUnit.Case, async: true

  alias Advent.Y2020.D08
  import D08, only: [part_one: 1, part_two: 1]

  @example [
    "nop +0",
    "acc +1",
    "jmp +4",
    "acc +3",
    "jmp -3",
    "acc -99",
    "acc +1",
    "jmp -4",
    "acc +6"
  ]

  describe "part_one/1" do
    test "solves example input" do
      assert 5 == part_one(@example)
    end

    test "solves puzzle input" do
      assert 1584 == part_one(puzzle_input!())
    end
  end

  describe "part_one/2" do
    test "solves example input" do
      assert 8 == part_two(@example)
    end

    test "solves puzzle input" do
      assert 920 == part_two(puzzle_input!())
    end
  end

  defp puzzle_input! do
    Path.join([__DIR__, "support", "d08_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
