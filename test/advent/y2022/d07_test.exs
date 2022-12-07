defmodule Advent.Y2022.D07Test do
  use TestHelper

  @example_input [
    "$ cd /",
    "$ ls",
    "dir a",
    "14848514 b.txt",
    "8504156 c.dat",
    "dir d",
    "$ cd a",
    "$ ls",
    "dir e",
    "29116 f",
    "2557 g",
    "62596 h.lst",
    "$ cd e",
    "$ ls",
    "584 i",
    "$ cd ..",
    "$ cd ..",
    "$ cd d",
    "$ ls",
    "4060174 j",
    "8033020 d.log",
    "5626152 d.ext",
    "7214296 k"
  ]

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 95_437,
    p1_solution: 1_555_642,
    p2_example_solution: 24_933_642,
    p2_solution: 5_974_547
  )
end
