defmodule Advent.Y2021.D10Test do
  use ExUnit.Case

  import Advent.Y2021.D10, only: [part_one: 1, part_two: 1]

  @example_input [
    "[({(<(())[]>[[{[]{<()<>>",
    "[(()[<>])]({[<{<<[]>>(",
    "{([(<{}[<>[]}>{[]{[(<()>",
    "(((({<>}<{<{<>}{[]{[]{}",
    "[[<[([]))<([[{}[[()]]]",
    "[{[{({}]{}}([{[{{{}}([]",
    "{<[[]]>}<{[{[{[]{()[[[]",
    "[<(<(<(<{}))><([]([]()",
    "<{([([[(<>()){}]>(<<{{",
    "<{([{{}}[<[[[<>{}]]]>[]]"
  ]

  describe "part_one" do
    test "solves example input" do
      assert part_one(@example_input) == 26_397
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input!()) == 315_693
    end
  end

  describe "part_two" do
    test "solves example input" do
      assert part_two(@example_input) == 288_957
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input!()) == 1_870_887_234
    end
  end

  @spec puzzle_input!() :: Enumerable.t()
  defp puzzle_input!() do
    Path.join([__DIR__, "support", "d10_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
