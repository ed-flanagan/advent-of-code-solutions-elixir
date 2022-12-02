defmodule Advent.Y2021.D01 do
  @moduledoc """
  https://adventofcode.com/2021/day/1
  """

  @doc """
  Count the number of times a depth measurement increases from the previous
  measurement 
  """
  @spec part_one(Enumerable.t()) :: non_neg_integer()
  def part_one(input) do
    input
    |> Stream.map(&String.to_integer/1)
    |> Stream.chunk_every(2, 1, :discard)
    |> Enum.count(fn [a, b] -> b > a end)
  end

  @doc """
  Consider sums of a three-measurement sliding window. How many sums are larger
  than the previous sum?
  """
  @spec part_two(Enumerable.t()) :: non_neg_integer()
  def part_two(input) do
    input
    |> Stream.map(&String.to_integer/1)
    |> Stream.chunk_every(4, 1, :discard)
    |> Enum.count(fn [a, _, _, b] -> b > a end)
  end
end
