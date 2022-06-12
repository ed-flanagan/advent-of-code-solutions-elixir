defmodule Advent.Y2021.D20Test do
  use ExUnit.Case, async: true

  import Advent.Y2021.D20, only: [part_one: 1, part_two: 1]

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
      assert part_one(puzzle_input!()) == 5231
    end
  end

  describe "part_two" do
    test "solves example input" do
      assert part_two(@example_input) == 3351
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input!()) == 14_279
    end
  end

  @spec puzzle_input!() :: Enumerable.t()
  defp puzzle_input!() do
    Path.join([__DIR__, "support", "d20_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
