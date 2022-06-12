defmodule Advent.Y2021.D25Test do
  use ExUnit.Case, async: true

  import ExUnit.CaptureIO

  import Advent.Y2021.D25

  @example_input [
    "v...>>.vv>",
    ".vv>>.vv..",
    ">>.>v>...v",
    ">>v>>.>.v.",
    "v>v.vv.v..",
    ">.>>..v...",
    ".vv..>.>v.",
    "v.v..>>v.v",
    "....v..v.>"
  ]

  describe "part_one" do
    test "solves example input" do
      assert part_one(@example_input) == 58
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input!()) == 456
    end
  end

  describe "part_two" do
    @tag :skip
    test "solves example input" do
      assert part_two(@example_input) == 0
    end

    @tag :skip
    test "solves puzzle input" do
      assert part_two(puzzle_input!()) == 0
    end
  end

  test "print_grid" do
    grid_out =
      capture_io(fn ->
        @example_input
        |> parse_input()
        |> print_grid()
      end)

    assert grid_out == """
           v...>>.vv>
           .vv>>.vv..
           >>.>v>...v
           >>v>>.>.v.
           v>v.vv.v..
           >.>>..v...
           .vv..>.>v.
           v.v..>>v.v
           ....v..v.>
           """
  end

  @spec puzzle_input!() :: Enumerable.t()
  defp puzzle_input!() do
    Path.join([__DIR__, "support", "d25_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
