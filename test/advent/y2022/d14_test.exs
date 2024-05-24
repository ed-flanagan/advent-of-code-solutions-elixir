defmodule Advent.Y2022.D14Test do
  use TestHelper

  @example_input [
    "498,4 -> 498,6 -> 496,6",
    "503,4 -> 502,4 -> 502,9 -> 494,9"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 24,
    p1_solution: 774,
    p2_example_solution: 93,
    p2_solution: 22_499
  )
end
