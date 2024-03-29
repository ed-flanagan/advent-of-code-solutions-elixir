defmodule Advent.Y2021.D12Test do
  use TestHelper

  @example_input [
    [
      "start-A",
      "start-b",
      "A-c",
      "A-b",
      "b-d",
      "A-end",
      "b-end"
    ],
    [
      "dc-end",
      "HN-start",
      "start-kj",
      "dc-start",
      "dc-HN",
      "LN-dc",
      "HN-end",
      "kj-sa",
      "kj-HN",
      "kj-dc"
    ],
    [
      "fs-end",
      "he-DX",
      "fs-he",
      "start-DX",
      "pj-DX",
      "end-zg",
      "zg-sl",
      "zg-pj",
      "pj-he",
      "RW-he",
      "fs-DX",
      "pj-RW",
      "zg-RW",
      "start-pj",
      "he-WI",
      "zg-he",
      "pj-fs",
      "start-RW"
    ]
  ]

  describe "part_one" do
    test "solves example input" do
      Enum.zip(@example_input, [10, 19, 226])
      |> Enum.each(fn {input, expected} ->
        assert part_one(input) == expected
      end)
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input()) == 5254
    end
  end

  describe "part_two" do
    test "solves example input" do
      Enum.zip(@example_input, [36, 103, 3509])
      |> Enum.each(fn {input, expected} ->
        assert part_two(input) == expected
      end)
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input()) == 149_385
    end
  end
end
