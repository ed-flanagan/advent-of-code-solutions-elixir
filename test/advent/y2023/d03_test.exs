defmodule Advent.Y2023.D03Test do
  use TestHelper

  @example_input ~w(
    467..114..
    ...*......
    ..35..633.
    ......#...
    617*......
    .....+.58.
    ..592.....
    ......755.
    ...$.*....
    .664.598..
  )

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 4361,
    p1_solution: 536_576,
    p2_example_solution: 467_835,
    p2_solution: 75_741_499
  )
end
