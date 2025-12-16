defmodule Advent.Y2025.D01Test do
  use TestHelper

  @example_input ~w(
    L68
    L30
    R48
    L5
    R60
    L55
    L1
    L99
    R14
    L82
  )

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 3,
    p1_solution: 1086
    # p2_example_solution: 0
    # p2_solution: 0
  )
end
