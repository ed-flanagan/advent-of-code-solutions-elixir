defmodule Advent.Y2022.D03 do
  @moduledoc """
  https://adventofcode.com/2022/day/3
  """

  @doc """
  Find the item type that appears in both compartments of each rucksack. What
  is the sum of the priorities of those item types?
  """
  @spec part_one(Enumerable.t()) :: integer()
  def part_one(input) do
    input
    |> Stream.map(&String.split_at(&1, div(String.length(&1), 2)))
    |> Stream.flat_map(&Tuple.to_list/1)
    |> solve(2)
  end

  @doc """
  Find the item type that corresponds to the badges of each three-Elf group.
  What is the sum of the priorities of those item types?
  """
  @spec part_two(Enumerable.t()) :: integer()
  def part_two(input) do
    solve(input, 3)
  end

  @spec solve(Enumerable.t(), pos_integer()) :: integer()
  defp solve(stream, group_size) do
    stream
    |> Stream.map(&String.to_charlist/1)
    |> Stream.map(
      &Enum.map(&1, fn
        c when c in ?a..?z -> c - 96
        c when c in ?A..?Z -> c - 38
      end)
    )
    |> Stream.map(&MapSet.new/1)
    |> Stream.chunk_every(group_size)
    |> Stream.flat_map(fn g -> Enum.reduce(g, &MapSet.intersection/2) end)
    |> Enum.sum()
  end
end
