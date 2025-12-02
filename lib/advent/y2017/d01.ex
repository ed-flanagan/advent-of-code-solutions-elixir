defmodule Advent.Y2017.D01 do
  @moduledoc """
  https://adventofcode.com/2017/day/1
  """

  @spec part_one(input :: String.t()) :: integer()
  def part_one(input) do
    (input <> String.first(input))
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
    |> sum_pairs()
  end

  @spec part_two(input :: String.t()) :: integer()
  def part_two(input) do
    nums =
      input
      |> String.graphemes()
      |> Enum.map(&String.to_integer/1)

    rotated_nums =
      nums
      |> Enum.split(Enum.count(nums) |> div(2))
      |> Tuple.to_list()
      |> Enum.reverse()
      |> List.flatten()

    [nums, rotated_nums]
    |> Enum.zip()
    |> Enum.reduce(0, fn
      {x, x}, sum -> sum + x
      _, sum -> sum
    end)
  end

  defp sum_pairs(list), do: do_sum_pairs(list, 0)

  defp do_sum_pairs([], sum), do: sum

  defp do_sum_pairs([a, a | tail], sum) do
    do_sum_pairs([a | tail], sum + a)
  end

  defp do_sum_pairs([_head | tail], sum) do
    do_sum_pairs(tail, sum)
  end
end
