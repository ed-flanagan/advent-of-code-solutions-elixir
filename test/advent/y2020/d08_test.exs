defmodule Advent.Y2020.D08Test do
  use TestHelper

  @example [
    "nop +0",
    "acc +1",
    "jmp +4",
    "acc +3",
    "jmp -3",
    "acc -99",
    "acc +1",
    "jmp -4",
    "acc +6"
  ]

  aoc_test(
    example_input: @example,
    p1_example_solution: 5,
    p2_example_solution: 8,
    p1_solution: 1584,
    p2_solution: 920
  )
end
