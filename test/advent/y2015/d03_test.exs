defmodule Advent.Y2015.D03Test do
  use ExUnit.Case, async: true

  alias Advent.Y2015.D03
  import D03, only: [part_one: 1, part_two: 1]

  describe "part_one/1" do
    test "solves example input" do
      examples = [
        {'>', 2},
        {'^>v<', 4},
        {'^v^v^v^v^v', 2}
      ]

      Enum.each(examples, fn {input, expected} ->
        assert expected == part_one(input)
      end)
    end

    test "solves puzzle input" do
      assert 2592 == part_one(puzzle_input!())
    end
  end

  describe "part_two/1" do
    test "solves example input" do
      examples = [
        {'^v', 3},
        {'^>v<', 3},
        {'^v^v^v^v^v', 11}
      ]

      Enum.each(examples, fn {input, expected} ->
        assert expected == part_two(input)
      end)
    end

    test "solves puzzle input" do
      assert 2360 == part_two(puzzle_input!())
    end
  end

  # Converts the first line into a charlist
  defp puzzle_input!() do
    Path.join([__DIR__, "support", "d03_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Enum.take(1)
    |> List.first()
    |> to_charlist
  end
end
