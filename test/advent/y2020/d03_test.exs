defmodule Advent.Y2020.D03Test do
  use ExUnit.Case, async: true

  import TestHelper
  import Advent.Y2020.D03

  @example [
    "..##.......",
    "#...#...#..",
    ".#....#..#.",
    "..#.#...#.#",
    ".#...##..#.",
    "..#.##.....",
    ".#.#.#....#",
    ".#........#",
    "#.##...#...",
    "#...##....#",
    ".#..#...#.#"
  ]

  # {right, down}
  @strategies [
    {1, 1},
    {3, 1},
    {5, 1},
    {7, 1},
    {1, 2}
  ]

  describe "part_one/1" do
    test "solves example input" do
      assert part_one(@example) == 7
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input()) == 280
    end
  end

  describe "part_two/2" do
    test "solves example input" do
      assert part_two(@example, @strategies) == 336
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input(), @strategies) == 4_355_551_200
    end
  end
end
