defmodule Advent.Y2021.D13Test do
  use TestHelper

  import ExUnit.CaptureIO

  @example_input [
    "6,10",
    "0,14",
    "9,10",
    "0,3",
    "10,4",
    "4,11",
    "6,0",
    "6,12",
    "4,1",
    "0,13",
    "10,12",
    "3,4",
    "3,0",
    "8,4",
    "1,10",
    "2,14",
    "8,10",
    "9,0",
    "",
    "fold along y=7",
    "fold along x=5"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 17,
    p1_solution: 788,
    p2_example_solution: [
      "#####",
      "#...#",
      "#...#",
      "#...#",
      "#####"
    ],
    # KJBKEUBG
    p2_solution: [
      "#..#...##.###..#..#.####.#..#.###...##.",
      "#.#.....#.#..#.#.#..#....#..#.#..#.#..#",
      "##......#.###..##...###..#..#.###..#...",
      "#.#.....#.#..#.#.#..#....#..#.#..#.#.##",
      "#.#..#..#.#..#.#.#..#....#..#.#..#.#..#",
      "#..#..##..###..#..#.####..##..###...###"
    ]
  )

  test "prints correctly" do
    assert capture_io(fn -> puzzle_input() |> part_two() |> print_part_two(true) end) == """
           \e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m
           \e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m
           \e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m
           \e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m
           \e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m
           \e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m
           """
  end
end
