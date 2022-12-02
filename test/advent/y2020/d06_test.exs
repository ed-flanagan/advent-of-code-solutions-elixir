defmodule Advent.Y2020.D06Test do
  use TestHelper

  @example [
    "abc",
    "",
    "a",
    "b",
    "c",
    "",
    "ab",
    "ac",
    "",
    "a",
    "a",
    "a",
    "a",
    "",
    "b"
  ]

  aoc_test(
    example_input: @example,
    p1_example_solution: 11,
    p2_example_solution: 6,
    p1_solution: 6430,
    p2_solution: 3125
  )
end
