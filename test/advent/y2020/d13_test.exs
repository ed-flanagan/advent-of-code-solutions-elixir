defmodule Advent.Y2020.D13Test do
  use TestHelper

  @example ~w(939 7,13,x,x,59,x,31,19)

  aoc_test(
    example_input: @example,
    p1_example_solution: 295,
    p1_solution: 3385
  )
end
