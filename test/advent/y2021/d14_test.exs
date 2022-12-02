defmodule Advent.Y2021.D14Test do
  use TestHelper

  @example_input [
    "NNCB",
    "",
    "CH -> B",
    "HH -> N",
    "CB -> H",
    "NH -> C",
    "HB -> C",
    "HC -> B",
    "HN -> C",
    "NN -> C",
    "BH -> H",
    "NC -> B",
    "NB -> B",
    "BN -> B",
    "BB -> N",
    "BC -> B",
    "CC -> N",
    "CN -> C"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 1588,
    p2_example_solution: 2_188_189_693_529,
    p1_solution: 2602,
    p2_solution: 2_942_885_922_173
  )
end
