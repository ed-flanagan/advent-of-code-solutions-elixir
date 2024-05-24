defmodule Advent.Y2022.D13Test do
  use TestHelper

  @example_input [
    "[1,1,3,1,1]",
    "[1,1,5,1,1]",
    "",
    "[[1],[2,3,4]]",
    "[[1],4]",
    "",
    "[9]",
    "[[8,7,6]]",
    "",
    "[[4,4],4,4]",
    "[[4,4],4,4,4]",
    "",
    "[7,7,7,7]",
    "[7,7,7]",
    "",
    "[]",
    "[3]",
    "",
    "[[[]]]",
    "[[]]",
    "",
    "[1,[2,[3,[4,[5,6,7]]]],8,9]",
    "[1,[2,[3,[4,[5,6,0]]]],8,9]"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 13,
    p1_solution: 4821,
    p2_example_solution: 140,
    p2_solution: 21_890
  )
end
