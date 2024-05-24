defmodule Advent.Y2022.D10Test do
  use TestHelper

  import ExUnit.CaptureIO

  @example_input [
    "addx 15",
    "addx -11",
    "addx 6",
    "addx -3",
    "addx 5",
    "addx -1",
    "addx -8",
    "addx 13",
    "addx 4",
    "noop",
    "addx -1",
    "addx 5",
    "addx -1",
    "addx 5",
    "addx -1",
    "addx 5",
    "addx -1",
    "addx 5",
    "addx -1",
    "addx -35",
    "addx 1",
    "addx 24",
    "addx -19",
    "addx 1",
    "addx 16",
    "addx -11",
    "noop",
    "noop",
    "addx 21",
    "addx -15",
    "noop",
    "noop",
    "addx -3",
    "addx 9",
    "addx 1",
    "addx -3",
    "addx 8",
    "addx 1",
    "addx 5",
    "noop",
    "noop",
    "noop",
    "noop",
    "noop",
    "addx -36",
    "noop",
    "addx 1",
    "addx 7",
    "noop",
    "noop",
    "noop",
    "addx 2",
    "addx 6",
    "noop",
    "noop",
    "noop",
    "noop",
    "noop",
    "addx 1",
    "noop",
    "noop",
    "addx 7",
    "addx 1",
    "noop",
    "addx -13",
    "addx 13",
    "addx 7",
    "noop",
    "addx 1",
    "addx -33",
    "noop",
    "noop",
    "noop",
    "addx 2",
    "noop",
    "noop",
    "noop",
    "addx 8",
    "noop",
    "addx -1",
    "addx 2",
    "addx 1",
    "noop",
    "addx 17",
    "addx -9",
    "addx 1",
    "addx 1",
    "addx -3",
    "addx 11",
    "noop",
    "noop",
    "addx 1",
    "noop",
    "addx 1",
    "noop",
    "noop",
    "addx -13",
    "addx -19",
    "addx 1",
    "addx 3",
    "addx 26",
    "addx -30",
    "addx 12",
    "addx -1",
    "addx 3",
    "addx 1",
    "noop",
    "noop",
    "noop",
    "addx -9",
    "addx 18",
    "addx 1",
    "addx 2",
    "noop",
    "noop",
    "addx 9",
    "noop",
    "noop",
    "noop",
    "addx -1",
    "addx 2",
    "addx -37",
    "addx 1",
    "addx 3",
    "noop",
    "addx 15",
    "addx -21",
    "addx 22",
    "addx -6",
    "addx 1",
    "noop",
    "addx 2",
    "addx 1",
    "noop",
    "addx -10",
    "noop",
    "noop",
    "addx 20",
    "addx 1",
    "addx 2",
    "addx 2",
    "addx -6",
    "addx -11",
    "noop",
    "noop",
    "noop"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 13_140,
    p1_solution: 12_840
  )

  describe "part two" do
    test "solves example input" do
      assert part_two(@example_input) == [
               "##..##..##..##..##..##..##..##..##..##..",
               "###...###...###...###...###...###...###.",
               "####....####....####....####....####....",
               "#####.....#####.....#####.....#####.....",
               "######......######......######......####",
               "#######.......#######.......#######....."
             ]
    end

    test "solves puzzle input" do
      # ZKJFBJFZ
      assert part_two(puzzle_input()) == [
               "####.#..#...##.####.###....##.####.####.",
               "...#.#.#.....#.#....#..#....#.#.......#.",
               "..#..##......#.###..###.....#.###....#..",
               ".#...#.#.....#.#....#..#....#.#.....#...",
               "#....#.#..#..#.#....#..#.#..#.#....#....",
               "####.#..#..##..#....###...##..#....####."
             ]
    end

    # File.stream!("priv/puzzle_input/y2022/d10.txt") |> Stream.map(&String.trim/1) |> Advent.Y2022.D10.part_two() |> Advent.Y2022.D10.print_part_two()
    test "prints correctly" do
      assert capture_io(fn -> puzzle_input() |> part_two() |> print_part_two(true) end) == """
             \e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m
             \e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m
             \e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m
             \e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m
             \e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m
             \e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m
             """
    end
  end
end
