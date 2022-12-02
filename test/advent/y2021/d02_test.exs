defmodule Advent.Y2021.D02Test do
  use TestHelper

  @example_input [
    "forward 5",
    "down 5",
    "forward 8",
    "up 3",
    "down 8",
    "forward 2"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 150,
    p2_example_solution: 900,
    p1_solution: 1_804_520,
    p2_solution: 1_971_095_320
  )
end
