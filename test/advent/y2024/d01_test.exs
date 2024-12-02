defmodule Advent.Y2024.D01Test do
  use TestHelper

  @example_input [
    "3   4",
    "4   3",
    "2   5",
    "1   3",
    "3   9",
    "3   3"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 11,
    p1_solution: 1_882_714,
    p2_example_solution: 31,
    p2_solution: 19_437_052
  )
end
