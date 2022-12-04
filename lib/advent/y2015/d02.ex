defmodule Advent.Y2015.D02 do
  @moduledoc """
  https://adventofcode.com/2015/day/2
  """

  @doc """
  All numbers in the elves' list are in feet. How many total square feet of
  wrapping paper should they order?
  """
  @spec part_one(Enumerable.t()) :: integer()
  def part_one(input) do
    input
    |> parse_input()
    |> Stream.map(fn [x, y, z] ->
      3 * x * y + 2 * z * (x + y)
    end)
    |> Enum.sum()
  end

  @doc """
  How many total feet of ribbon should they order?
  """
  @spec part_two(Enumerable.t()) :: integer()
  def part_two(input) do
    input
    |> parse_input()
    |> Stream.map(fn [x, y, z] ->
      2 * (x + y) + x * y * z
    end)
    |> Enum.sum()
  end

  # This creates a stream that will map each set of dimensions into a sorted list
  @spec parse_input(Enumerable.t()) :: Enumerable.t()
  defp parse_input(input) do
    input
    |> Stream.map(&String.split(&1, "x"))
    |> Stream.map(fn d ->
      Enum.map(d, &String.to_integer/1)
    end)
    |> Stream.map(&Enum.sort/1)
  end
end
