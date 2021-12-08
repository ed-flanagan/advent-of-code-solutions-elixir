defmodule Advent.Y2015.D04Test do
  use ExUnit.Case

  alias Advent.Y2015.D04
  import D04, only: [part_one: 2, part_two: 2]

  describe "part_one/2" do
    test "solves example input" do
      [
        {"abcdef", 609_043},
        {"pqrstuv", 1_048_970}
      ]
      |> Enum.each(fn {input, expected} ->
        assert expected == part_one(input, 1_200_000)
      end)
    end

    test "solves puzzle input" do
      assert 117_946 == part_one("ckczppom", 150_000)
    end

    test "limit works" do
      assert :error == part_one("deadbeef", 5)
    end
  end

  describe "part_two/2" do
    test "solves puzzle input" do
      assert 3_938_038 == part_two(puzzle_input!(), 4_000_000)
    end

    test "limit works" do
      assert :error == part_two("deadbeef", 5)
    end
  end

  defp puzzle_input!() do
    "ckczppom"
  end
end
