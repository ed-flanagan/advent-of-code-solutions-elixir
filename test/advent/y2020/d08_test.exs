defmodule Advent.Y2020.D08Test do
  use ExUnit.Case, async: true

  import Advent.Y2020.D08
  import TestHelper

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
      assert 1584 == part_one(puzzle_input())
    end
  end

  describe "part_one/2" do
    test "solves example input" do
      assert 8 == part_two(@example)
    end

    test "solves puzzle input" do
      assert 920 == part_two(puzzle_input())
    end
  end
end
