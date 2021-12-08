defmodule Advent.Y2020.D11Test do
  use ExUnit.Case

  alias Advent.Y2020.D11
  import D11, only: [part_one: 1, part_two: 1]

  @example [
    "L.LL.LL.LL",
    "LLLLLLL.LL",
    "L.L.L..L..",
    "LLLL.LL.LL",
    "L.LL.LL.LL",
    "L.LLLLL.LL",
    "..L.L.....",
    "LLLLLLLLLL",
    "L.LLLLLL.L",
    "L.LLLLL.LL"
  ]
  describe "part_one/1" do
    test "solves example input" do
      assert 37 == part_one(@example)
    end

    test "solves puzzle input" do
      assert 2247 == part_one(puzzle_input!())
    end
  end

  describe "part_two/1" do
    @tag :skip
    test "solves example input" do
      assert 26 == part_one(@example)
    end

    @tag :skip
    test "solves puzzle input" do
      assert part_two(puzzle_input!()) == 0
    end
  end

  defp puzzle_input!() do
    [__DIR__, "support", "d11_input.txt"]
    |> Path.join()
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
