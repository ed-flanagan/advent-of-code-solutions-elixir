defmodule Advent.Y2022.D05Test do
  use TestHelper

  @example_input [
    "    [D]    ",
    "[N] [C]    ",
    "[Z] [M] [P]",
    " 1   2   3 ",
    "",
    "move 1 from 2 to 1",
    "move 3 from 1 to 3",
    "move 2 from 2 to 1",
    "move 1 from 1 to 2"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: "CMZ",
    p1_solution: "VGBBJCRMN",
    p2_example_solution: "MCD",
    p2_solution: "LBBVJBRMH"
  )
end
