defmodule Advent.Y2024.D03Test do
  use TestHelper

  @example_input [
    "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 161,
    p1_solution: 167_090_022
    # p2_example_solution: 0
    # p2_solution: 0
  )
end
