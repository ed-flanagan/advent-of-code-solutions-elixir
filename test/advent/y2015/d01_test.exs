defmodule Advent.Y2015.D01Test do
  use ExUnit.Case, async: true

  alias Advent.Y2015.D01

  describe "part_one/1" do
    test "solves example input" do
      examples = [
        {'(())', 0},
        {'()()', 0},
        {'(((', 3},
        {'(()(()(', 3},
        {'))(((((', 3},
        {'())', -1},
        {'))(', -1},
        {')))', -3},
        {')())())', -3}
      ]

      Enum.each(examples, fn {input, expected} ->
        assert expected == D01.part_one(input)
      end)
    end

    test "solves puzzle input" do
      assert 138 == D01.part_one(puzzle_input())
    end
  end

  describe "part_two/1" do
    test "solves example input" do
      examples = [
        {')', 1},
        {'()())', 5}
      ]

      Enum.each(examples, fn {input, expected} ->
        assert expected == D01.part_two(input)
      end)
    end

    test "solves puzzle input" do
      assert 1771 == D01.part_two(puzzle_input())
    end
  end

  defp puzzle_input() do
    Path.join([__DIR__, "support", "d01_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Enum.take(1)
    |> List.first()
    |> to_charlist
  end
end
