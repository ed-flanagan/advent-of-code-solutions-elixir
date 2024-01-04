defmodule Advent.Y2023.D05Test do
  use TestHelper

  @example_input """
  seeds: 79 14 55 13

  seed-to-soil map:
  50 98 2
  52 50 48

  soil-to-fertilizer map:
  0 15 37
  37 52 2
  39 0 15

  fertilizer-to-water map:
  49 53 8
  0 11 42
  42 0 7
  57 7 4

  water-to-light map:
  88 18 7
  18 25 70

  light-to-temperature map:
  45 77 23
  81 45 19
  68 64 13

  temperature-to-humidity map:
  0 69 1
  1 0 69

  humidity-to-location map:
  60 56 37
  56 93 4
  """

  aoc_test(
    example_input: @example_input,
    input_opts: [file?: true],
    p1_example_solution: 35,
    p1_solution: 214_922_730
    # p2_example_solution: 46,
    # p2_solution: 0
  )

  describe "part two" do
    test "solves example input" do
      assert part_two(@example_input) == 46
    end

    @tag long_running: true
    test "solves puzzle input" do
      assert part_two(puzzle_input(file?: true)) == 0
    end
  end
end
