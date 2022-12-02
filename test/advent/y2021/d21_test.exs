defmodule Advent.Y2021.D21Test do
  use TestHelper

  @example_input [
    "Player 1 starting position: 4",
    "Player 2 starting position: 8"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 739_785,
    p1_solution: 734_820
  )
end
