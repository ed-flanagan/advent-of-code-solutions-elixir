defmodule Advent.Y2021.D09Test do
  use TestHelper

  @example_input [
    "2199943210",
    "3987894921",
    "9856789892",
    "8767896789",
    "9899965678"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 15,
    p2_example_solution: 1134,
    p1_solution: 444,
    p2_solution: 1_168_440
  )
end
