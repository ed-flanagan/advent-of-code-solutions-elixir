defmodule Advent.Y2020.D09Test do
  use ExUnit.Case, async: true

  import Advent.Y2020.D09
  import TestHelper

  @example [
    "35",
    "20",
    "15",
    "25",
    "47",
    "40",
    "62",
    "55",
    "65",
    "95",
    "102",
    "117",
    "150",
    "182",
    "127",
    "219",
    "299",
    "277",
    "309",
    "576"
  ]

  describe "part_one/2" do
    test "solves example input" do
      assert 127 == part_one(@example, 5)
    end

    test "solves puzzle input" do
      assert 29_221_323 == part_one(puzzle_input(), 25)
    end
  end

  describe "part_two/2" do
    test "solves example input" do
      assert 62 == part_two(@example, 5)
    end

    test "solves puzzle input" do
      assert 4_389_369 == part_two(puzzle_input(), 25)
    end
  end
end
