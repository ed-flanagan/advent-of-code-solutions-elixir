defmodule Advent.Y2022.D12Test do
  use TestHelper

  @example_input ~w(
    Sabqponm
    abcryxxl
    accszExk
    acctuvwj
    abdefghi
  )

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 31,
    p1_solution: 437,
    p2_example_solution: 29,
    p2_solution: 430
  )
end
