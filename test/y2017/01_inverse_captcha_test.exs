defmodule Advent.Y2020.D01Test do
  use ExUnit.Case

  alias Advent.Y2017.D01
  import D01, only: [part_one: 1]

  describe "part_one/1" do
    test "solves example input" do
      [
        {"1122", 3},
        {"1111", 4},
        {"1234", 0},
        {"91212129", 9},
        {"112231", 4}
      ]
      |> Enum.each(fn {input, expected} ->
        assert expected == part_one(input)
      end)
    end

    test "solves puzzle input" do
      assert 1216 == part_one(puzzle_input!())
    end
  end

  defp puzzle_input!() do
    Path.join([__DIR__, "support", "01_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Enum.take(1)
    |> List.first()
  end
end
