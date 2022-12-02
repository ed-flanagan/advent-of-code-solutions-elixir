defmodule Advent.Y2021.D03Test do
  use TestHelper

  @example_input [
    "00100",
    "11110",
    "10110",
    "10111",
    "10101",
    "01111",
    "00111",
    "11100",
    "10000",
    "11001",
    "00010",
    "01010"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 198,
    p2_example_solution: 230,
    p1_solution: 3_242_606,
    p2_solution: 4_856_080
  )
end
