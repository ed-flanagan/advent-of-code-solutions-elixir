defmodule Advent.Y2022.D02Test do
  use TestHelper

  @example_input [
    "A Y",
    "B X",
    "C Z"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 15,
    p1_solution: 11_906,
    p2_example_solution: 12,
    p2_solution: 11_186
  )
end
