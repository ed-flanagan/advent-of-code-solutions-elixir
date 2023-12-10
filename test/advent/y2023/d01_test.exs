defmodule Advent.Y2023.D01Test do
  use TestHelper

  @part1_example_input ~w(
    1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet
  )

  @part2_example_input ~w(
    two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    7pqrstsixteen
  )

  describe "part_one" do
    test "solves example input" do
      assert part_one(@part1_example_input) == 142
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input()) == 55_538
    end
  end

  describe "part_two" do
    test "solves example input" do
      assert part_two(@part2_example_input) == 281
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input()) == 54_875
    end
  end
end
