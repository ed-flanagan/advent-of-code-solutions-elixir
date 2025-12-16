defmodule Advent.Y2025.D01 do
  @moduledoc """
  https://adventofcode.com/2025/day/1
  """

  @doc """
  """
  @spec part_one(Enumerable.t()) :: any()
  def part_one(input) do
    input
    |> parse_input()
    |> Enum.scan(50, &Integer.mod(&1 + &2, 100))
    |> Enum.count(&(&1 == 0))
  end

  @doc """
  """
  @spec part_two(Enumerable.t()) :: any()
  def part_two(_input) do
    0
  end

  @spec parse_input(Enumerable.t()) :: Enumerable.t()
  defp parse_input(input) do
    input
    |> Enum.map(&String.trim/1)
    |> Enum.map(fn
      "R" <> inc -> String.to_integer(inc)
      "L" <> inc -> -1 * String.to_integer(inc)
    end)
  end
end
