defmodule Advent.Y2020.D12Test do
  use TestHelper

  @example ~w(F10 N3 F7 R90 F11)

  aoc_test(
    example_input: @example,
    p1_example_solution: 25,
    p2_example_solution: 286,
    p1_solution: 1441,
    p2_solution: 61_616
  )
end
