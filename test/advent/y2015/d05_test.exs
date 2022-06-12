defmodule Advent.Y2015.D05Test do
  use ExUnit.Case, async: true

  alias Advent.Y2015.D05
  import D05, only: [part_one: 1, part_two: 1]

  describe "part_one/1" do
    test "solves example input" do
      example = [
        # nice
        "ugknbfddgicrmopn",
        # nice
        "aaa",
        # naughty
        "jchzalrnumimnmhp",
        # naughty
        "haegwjzuvuyypxyu",
        # naughty
        "dvszwmarrgswjxmb"
      ]

      assert 2 == part_one(example)
    end

    test "solves puzzle input" do
      assert 236 == part_one(puzzle_input!())
    end
  end

  describe "part_two/1" do
    test "solves example input" do
      example = [
        # naughty
        "aaa",
        # nice
        "qjhvhtzxzqqjkmpb",
        # nice
        "xxyxx",
        # naughty
        "uurcxstgmygtbstg",
        # naughty
        "ieodomkazucvgmuy",
        # nice
        "rxexcbwhiywwwwnu"
      ]

      assert 3 == part_two(example)
    end

    test "solves puzzle input" do
      assert 51 == part_two(puzzle_input!())
    end
  end

  defp puzzle_input!() do
    Path.join([__DIR__, "support", "d05_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
