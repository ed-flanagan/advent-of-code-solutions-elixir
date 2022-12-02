defmodule Advent.Y2019.D01Test do
  use TestHelper

  @example_input ~w(12 14 1969 100756)

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 34_241,
    p1_solution: 3_454_026,
    p2_example_solution: 51_316,
    p2_solution: 5_178_170
  )
end
