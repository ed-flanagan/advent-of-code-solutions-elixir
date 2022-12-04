defmodule Advent.Y2022.D04Test do
  use TestHelper

  @example_input ~w(
    2-4,6-8
    2-3,4-5
    5-7,7-9
    2-8,3-7
    6-6,4-6
    2-6,4-8
  )

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 2,
    p1_solution: 588,
    p2_example_solution: 4,
    p2_solution: 911
  )
end
