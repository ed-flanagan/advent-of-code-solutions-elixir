defmodule Advent.Y2021.D25Test do
  use TestHelper

  import ExUnit.CaptureIO

  @example_input ~w(
    v...>>.vv>
    .vv>>.vv..
    >>.>v>...v
    >>v>>.>.v.
    v>v.vv.v..
    >.>>..v...
    .vv..>.>v.
    v.v..>>v.v
    ....v..v.>
  )

  aoc_test(
    example_input: @example_input,
    p1_example_solution: 58,
    p1_solution: 456
  )

  describe "part_one" do
    test "solves example input" do
      assert part_one(@example_input) == 58
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input()) == 456
    end
  end

  test "print_grid" do
    grid_out =
      capture_io(fn ->
        @example_input
        |> parse_input()
        |> print_grid()
      end)

    assert grid_out == Enum.join(@example_input, "\n") <> "\n"
  end
end
