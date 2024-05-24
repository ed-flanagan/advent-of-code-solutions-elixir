defmodule Advent.Y2023.D06Test do
  use TestHelper

  @example_input [
    "Time:      7  15   30",
    "Distance:  9  40  200"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 288,
    p1_solution: 1_084_752,
    p2_example_solution: 71_503,
    p2_solution: 28_228_952
  )
end
