defmodule Advent.Y2024.D03 do
  @moduledoc """
  https://adventofcode.com/2024/day/3
  """

  @doc """
  """
  @spec part_one(Enumerable.t()) :: non_neg_integer()
  def part_one(input) do
    input
    |> Enum.flat_map(fn line ->
      Regex.scan(~r/mul\((\d+),(\d+)\)/, line, capture: :all_but_first)
    end)
    |> Enum.map(fn pair ->
      pair
      |> Enum.map(&String.to_integer/1)
      |> Enum.reduce(&Kernel.*/2)
    end)
    |> Enum.sum()
  end

  @doc """
  """
  @spec part_two(Enumerable.t()) :: any()
  def part_two(_input) do
    0
  end
end
