defmodule Advent.Y2022.D01Test do
  use TestHelper

  @example_input [
    "1000",
    "2000",
    "3000",
    "",
    "4000",
    "",
    "5000",
    "6000",
    "",
    "7000",
    "8000",
    "9000",
    "",
    "10000"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 24_000,
    p1_solution: 71_023,
    p2_example_solution: 45_000,
    p2_solution: 206_289
  )
end
