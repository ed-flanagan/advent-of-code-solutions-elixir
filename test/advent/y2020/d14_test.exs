defmodule Advent.Y2020.D14Test do
  use TestHelper

  @example [
    "mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X",
    "mem[8] = 11",
    "mem[7] = 101",
    "mem[8] = 0"
  ]

  describe "part_one/1" do
    test "solves example input" do
      assert part_one(@example) == 165
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input()) == 15_919_415_426_101
    end
  end
end
