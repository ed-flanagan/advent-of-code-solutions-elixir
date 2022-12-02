defmodule Advent.Y2021.D15Test do
  use TestHelper

  @example_input [
    "1163751742",
    "1381373672",
    "2136511328",
    "3694931569",
    "7463417111",
    "1319128137",
    "1359912421",
    "3125421639",
    "1293138521",
    "2311944581"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 40,
    p2_example_solution: 315,
    p1_solution: 435,
    p2_solution: 2842
  )
end
