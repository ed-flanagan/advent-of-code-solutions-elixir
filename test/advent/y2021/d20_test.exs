defmodule Advent.Y2021.D20Test do
  use ExUnit.Case, async: true

  import Advent.Y2021.D20
  import TestHelper

  @example_input [
    "..#.#..#####.#.#.#.###.##.....###.##.#..###.####..#####..#....#..#..##..##",
    "#..######.###...####..#..#####..##..#.#####...##.#.#..#.##..#.#......#.###",
    ".######.###.####...#.##.##..#..#..#####.....#.#....###..#.##......#.....#.",
    ".#..#..##..#...##.######.####.####.#.#...#.......#..#.#.#...####.##.#.....",
    ".#..#...##.#.##..#...##.#.##..###.#......#.#.......#.#.#.####.###.##...#..",
    "...####.#..#..#.##.#....##..#.####....##...##..#...#......#.#.......#.....",
    "..##..####..#...#.#.#...##..#.#..###..#####........#..####......#..#",
    "",
    "#..#.",
    "#....",
    "##..#",
    "..#..",
    "..###"
  ]

  describe "part_one" do
    test "solves example input" do
      assert part_one(@example_input) == 35
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input()) == 5231
    end
  end

  describe "part_two" do
    test "solves example input" do
      assert part_two(@example_input) == 3351
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input()) == 14_279
    end
  end
end
