defmodule Advent.Y2022.D09Test do
  use TestHelper

  @example_input [
    [
      "R 4",
      "U 4",
      "L 3",
      "D 1",
      "R 4",
      "D 1",
      "L 5",
      "R 2"
    ],
    [
      "R 5",
      "U 8",
      "L 8",
      "D 3",
      "R 17",
      "D 10",
      "L 25",
      "U 20"
    ]
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: [13, 88],
    p1_solution: 6197,
    p2_example_solution: [1, 36],
    p2_solution: 2562
  )
end
