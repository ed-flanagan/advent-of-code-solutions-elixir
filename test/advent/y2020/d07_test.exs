defmodule Advent.Y2020.D07Test do
  use ExUnit.Case, async: true

  import Advent.Y2020.D07
  import TestHelper

  describe "part_one/1" do
    test "solves example input" do
      example = [
        "light red bags contain 1 bright white bag, 2 muted yellow bags.",
        "dark orange bags contain 3 bright white bags, 4 muted yellow bags.",
        "bright white bags contain 1 shiny gold bag.",
        "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.",
        "shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.",
        "dark olive bags contain 3 faded blue bags, 4 dotted black bags.",
        "vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.",
        "faded blue bags contain no other bags.",
        "dotted black bags contain no other bags."
      ]

      assert 4 == part_one(example)
    end

    test "solves puzzle input" do
      assert 164 == part_one(puzzle_input())
    end
  end

  describe "part_two/1" do
    test "solves example input" do
      examples = [
        {
          [
            "shiny gold bags contain 2 dark red bags.",
            "dark red bags contain 2 dark orange bags.",
            "dark orange bags contain 2 dark yellow bags.",
            "dark yellow bags contain 2 dark green bags.",
            "dark green bags contain 2 dark blue bags.",
            "dark blue bags contain 2 dark violet bags.",
            "dark violet bags contain no other bags."
          ],
          126
        },
        {
          [
            "light red bags contain 1 bright white bag, 2 muted yellow bags.",
            "dark orange bags contain 3 bright white bags, 4 muted yellow bags.",
            "bright white bags contain 1 shiny gold bag.",
            "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.",
            "shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.",
            "dark olive bags contain 3 faded blue bags, 4 dotted black bags.",
            "vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.",
            "faded blue bags contain no other bags.",
            "dotted black bags contain no other bags."
          ],
          32
        }
      ]

      Enum.each(examples, fn {rules, expected} ->
        assert expected == part_two(rules)
      end)
    end

    test "solves puzzle input" do
      assert 7872 == part_two(puzzle_input())
    end
  end
end
