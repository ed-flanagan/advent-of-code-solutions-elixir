defmodule Advent.Y2020.D14Test do
  use ExUnit.Case

  alias Advent.Y2020.D14
  import D14, only: [part_one: 1]

  @example [
    "mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X",
    "mem[8] = 11",
    "mem[7] = 101",
    "mem[8] = 0"
  ]

  describe "part_one/1" do
    test "solves example input" do
      assert 165 == part_one(@example)
    end

    test "solves puzzle input" do
      assert 15_919_415_426_101 == part_one(puzzle_input!())
    end
  end

  defp puzzle_input!() do
    [__DIR__, "support", "d14_input.txt"]
    |> Path.join()
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
