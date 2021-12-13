defmodule Advent.Y2021.D13Test do
  use ExUnit.Case

  import ExUnit.CaptureIO

  import Advent.Y2021.D13, only: [part_one: 1, part_two: 1, print_part_two: 1]

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

  describe "part_one" do
    test "solves example input" do
      assert part_one(@example_input) == 17
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input!()) == 788
    end
  end

  describe "part_two" do
    test "solves example input" do
      # O
      assert part_two(@example_input) == [
               "#####",
               "#...#",
               "#...#",
               "#...#",
               "#####"
             ]
    end

    test "solves puzzle input" do
      # KJBKEUBG
      assert part_two(puzzle_input!()) == [
               "#..#...##.###..#..#.####.#..#.###...##.",
               "#.#.....#.#..#.#.#..#....#..#.#..#.#..#",
               "##......#.###..##...###..#..#.###..#...",
               "#.#.....#.#..#.#.#..#....#..#.#..#.#.##",
               "#.#..#..#.#..#.#.#..#....#..#.#..#.#..#",
               "#..#..##..###..#..#.####..##..###...###"
             ]
    end

    test "prints correctly" do
      assert capture_io(fn -> print_part_two(part_two(puzzle_input!())) end) == """
             \e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m
             \e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m
             \e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m
             \e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m
             \e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m
             \e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[40m\e[30m.\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m\e[42m\e[32m#\e[0m
             """
    end
  end

  @spec puzzle_input!() :: Enumerable.t()
  defp puzzle_input!() do
    Path.join([__DIR__, "support", "d13_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
