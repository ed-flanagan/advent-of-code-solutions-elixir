defmodule Advent.Y2022.D04 do
  @moduledoc """
  https://adventofcode.com/2022/day/4
  """

  @doc """
  In how many assignment pairs does one range fully contain the other?
  """
  @spec part_one(Enumerable.t()) :: integer()
  def part_one(input) do
    input
    |> parse_input()
    |> Enum.count(fn {r1 = r1s..r1e, r2 = r2s..r2e} ->
      (r1s in r2 && r1e in r2) || (r2s in r1 && r2e in r1)
    end)
  end

  @doc """
  In how many assignment pairs do the ranges overlap?
  """
  @spec part_two(Enumerable.t()) :: integer()
  def part_two(input) do
    input
    |> parse_input()
    |> Enum.count(fn {r1, r2} -> !Range.disjoint?(r1, r2) end)
  end

  @spec parse_input(Enumerable.t()) :: Enumerable.t()
  defp parse_input(input) do
    input
    |> Stream.map(fn pair ->
      pair
      |> String.split(["-", ","])
      |> Enum.map(&String.to_integer/1)
    end)
    |> Stream.map(fn [r1s, r1e, r2s, r2e] -> {r1s..r1e, r2s..r2e} end)
  end
end
