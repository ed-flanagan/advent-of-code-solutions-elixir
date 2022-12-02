defmodule Advent.Y2020.D11Test do
  use TestHelper

  @example ~w(
    L.LL.LL.LL
    LLLLLLL.LL
    L.L.L..L..
    LLLL.LL.LL
    L.LL.LL.LL
    L.LLLLL.LL
    ..L.L.....
    LLLLLLLLLL
    L.LLLLLL.L
    L.LLLLL.LL
  )

  aoc_test(
    example_input: @example,
    p1_example_solution: 37,
    p1_solution: 2247
  )
end
