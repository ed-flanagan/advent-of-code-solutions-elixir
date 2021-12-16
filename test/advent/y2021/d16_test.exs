defmodule Advent.Y2021.D16Test do
  use ExUnit.Case

  import Advent.Y2021.D16, only: [part_one: 1, part_two: 1]

  describe "part_one" do
    test "solves example input" do
      [
        {"D2FE28", 6},
        {"38006F45291200", 9},
        {"EE00D40C823060", 14},
        {"8A004A801A8002F478", 16},
        {"620080001611562C8802118E34", 12},
        {"C0015000016115A2E0802F182340", 23},
        {"A0016C880162017C3686B18A3D4780", 31}
      ]
      |> Enum.each(fn {input, expected} ->
        assert part_one(input) == expected
      end)
    end

    test "solves puzzle input" do
      assert part_one(puzzle_input!()) == 945
    end
  end

  describe "part_two" do
    test "solves example input" do
      [
        {"C200B40A82", 3},
        {"04005AC33890", 54},
        {"880086C3E88112", 7},
        {"CE00C43D881120", 9},
        {"D8005AC2A8F0", 1},
        {"F600BC2D8F", 0},
        {"9C005AC2F8F0", 0},
        {"9C0141080250320F1802104A08", 1}
      ]
      |> Enum.each(fn {input, expected} ->
        assert part_two(input) == expected
      end)
    end

    test "solves puzzle input" do
      assert part_two(puzzle_input!()) == 10_637_009_915_279
    end
  end

  @spec puzzle_input!() :: Enumerable.t()
  defp puzzle_input!() do
    Path.join([__DIR__, "support", "d16_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Enum.at(0)
  end
end
