defmodule Advent.Y2020.D01Test do
  use TestHelper

  @example_input ~w(1721 979 366 299 675 1456)

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 514_579,
    p2_example_solution: 241_861_950,
    p1_solution: 1_006_176,
    p2_solution: 199_132_160
  )
end
