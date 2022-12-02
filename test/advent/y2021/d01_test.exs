defmodule Advent.Y2021.D01Test do
  use TestHelper

  @example_input [
    "199",
    "200",
    "208",
    "210",
    "200",
    "207",
    "240",
    "269",
    "260",
    "263"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 7,
    p2_example_solution: 5,
    p1_solution: 1226,
    p2_solution: 1252
  )
end
