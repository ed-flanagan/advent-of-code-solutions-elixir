defmodule Advent.Y2020.D12Test do
  use ExUnit.Case, async: true

  alias Advent.Y2020.D12
  import D12, only: [part_one: 1, part_two: 1]

  @example ~w(F10 N3 F7 R90 F11)

  describe "part_one/1" do
    test "solves example input" do
      assert 25 == part_one(@example)
    end

    test "solves puzzle input" do
      assert 1441 == part_one(puzzle_input!())
    end
  end

  describe "part_two/1" do
    test "solves example input" do
      assert 286 == part_two(@example)
    end

    test "solves puzzle input" do
      assert 61_616 == part_two(puzzle_input!())
    end
  end

  defp puzzle_input!() do
    [__DIR__, "support", "d12_input.txt"]
    |> Path.join()
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
