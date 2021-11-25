defmodule Advent.Y2020.D10Test do
  use ExUnit.Case

  alias Advent.Y2020.D10
  import D10, only: [part_one: 1, part_two: 1]

  describe "part_one/1" do
    test "solves example input" do
      examples = [
        {35, ~w(16 10 15 5 1 11 7 19 6 12 4)},
        {220,
         ~w(28 33 18 42 31 14 46 20 48 47 24 23 49 45 19 38 39 11 1 32 25 35 8 17 7 9 4 2 34 10 3)}
      ]

      Enum.each(examples, fn {expected, input} ->
        assert expected == part_one(input)
      end)
    end

    test "solves puzzle input" do
      assert 2312 == part_one(puzzle_input!())
    end
  end

  describe "part_two/1" do
    test "solves example input" do
      examples = [
        {8, ~w(16 10 15 5 1 11 7 19 6 12 4)},
        {19_208,
         ~w(28 33 18 42 31 14 46 20 48 47 24 23 49 45 19 38 39 11 1 32 25 35 8 17 7 9 4 2 34 10 3)}
      ]

      Enum.each(examples, fn {expected, input} ->
        assert expected == part_two(input)
      end)
    end

    test "solves puzzle input" do
      # IO.inspect parg_two(puzzle_input!())
    end
  end

  defp puzzle_input!() do
    Path.join([__DIR__, "support", "d10_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
