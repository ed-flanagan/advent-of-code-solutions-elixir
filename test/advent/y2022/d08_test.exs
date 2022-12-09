defmodule Advent.Y2022.D08Test do
  use TestHelper

  @example_input ~w(
    30373
    25512
    65332
    33549
    35390
  )

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 21,
    p1_solution: 1533,
    p2_example_solution: 8,
    p2_solution: 345_744
  )
end
