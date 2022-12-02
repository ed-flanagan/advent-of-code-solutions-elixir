defmodule Advent.Y2021.D05Test do
  use TestHelper

  @example_input [
    "0,9 -> 5,9",
    "8,0 -> 0,8",
    "9,4 -> 3,4",
    "2,2 -> 2,1",
    "7,0 -> 7,4",
    "6,4 -> 2,0",
    "0,9 -> 2,9",
    "3,4 -> 1,4",
    "0,0 -> 8,8",
    "5,5 -> 8,2"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 5,
    p2_example_solution: 12,
    p1_solution: 5608,
    p2_solution: 20_299
  )
end
