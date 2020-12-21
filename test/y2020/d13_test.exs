defmodule Advent.Y2020.D13Test do
  use ExUnit.Case

  alias Advent.Y2020.D13
  import D13, only: [part_one: 1, part_two: 1]

  @example [
    "939",
    "7,13,x,x,59,x,31,19"
  ]

  describe "part_one/1" do
    test "solves example input" do
      assert 295 == part_one(@example)
    end

    test "solves puzzle input" do
      assert 3385 == part_one(puzzle_input!())
    end
  end

  describe "part_two/1" do
    test "solves example input" do
      assert 1_068_788 == part_two(@example)
    end

    test "solves puzzle input" do
      # IO.inspect part_two(puzzle_input!())
    end
  end

  defp puzzle_input!() do
    [__DIR__, "support", "d13_input.txt"]
    |> Path.join()
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
