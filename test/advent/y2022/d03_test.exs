defmodule Advent.Y2022.D03Test do
  use TestHelper

  @example_input ~w(
    vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw
  )

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 157,
    p1_solution: 8085,
    p2_example_solution: 70,
    p2_solution: 2515
  )
end
