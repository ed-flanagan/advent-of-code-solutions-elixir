defmodule Advent.Y2022.D06Test do
  use TestHelper

  @example_input [
    ["mjqjpqmgbljsphdztnvjfqwrcgsmlb"],
    ["bvwbjplbgvbhsrlpgdmjqwftvncz"],
    ["nppdvjthqldpwncqszvftbrmjlhg"],
    ["nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"],
    ["zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"]
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: [7, 5, 6, 10, 11],
    p1_solution: 1538,
    p2_example_solution: [19, 23, 23, 29, 26],
    p2_solution: 2315
  )
end
