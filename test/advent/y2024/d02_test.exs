defmodule Advent.Y2024.D02Test do
  use TestHelper

  @example_input [
    "7 6 4 2 1",
    "1 2 7 8 9",
    "9 7 6 2 1",
    "1 3 2 4 5",
    "8 6 4 4 1",
    "1 3 6 7 9"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 2,
    p1_solution: 591
    # p2_example_solution: 0
    # p2_solution: 0
  )
end
