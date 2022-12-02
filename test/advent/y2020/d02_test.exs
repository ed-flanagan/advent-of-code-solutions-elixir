defmodule Advent.Y2020.D02Test do
  use TestHelper

  @example_input [
    "1-3 a: abcde",
    "1-3 b: cdefg",
    "2-9 c: ccccccccc"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 2,
    p2_example_solution: 1,
    p1_solution: 620,
    p2_solution: 727
  )
end
