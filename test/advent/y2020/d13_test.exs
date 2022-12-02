defmodule Advent.Y2020.D13Test do
  use ExUnit.Case, async: true

  import Advent.Y2020.D13
  import TestHelper

  @example ~w(939 7,13,x,x,59,x,31,19)

  describe "part_one/1" do
    test "solves example input" do
      assert 295 == part_one(@example)
    end

    test "solves puzzle input" do
      assert 3385 == part_one(puzzle_input())
    end
  end

  describe "part_two/1" do
    @tag :skip
    test "solves example input" do
      assert 1_068_788 == part_two(@example)
    end

    @tag :skip
    test "solves puzzle input" do
      assert part_two(puzzle_input()) == 0
    end
  end
end
