defmodule Advent.Y2024.D01 do
  @moduledoc """
  https://adventofcode.com/2024/day/1
  """

  @doc """
  """
  @spec part_one(Enumerable.t()) :: non_neg_integer()
  def part_one(input) do
    input
    |> parse_input()
    |> Tuple.to_list()
    |> Enum.map(&Enum.sort/1)
    |> Enum.zip()
    |> Enum.map(fn {x, y} ->
      abs(y - x)
    end)
    |> Enum.sum()
  end

  @doc """
  """
  @spec part_two(Enumerable.t()) :: non_neg_integer()
  def part_two(input) do
    {first, second} = parse_input(input)

    freq = Enum.frequencies(second)

    first
    |> Enum.map(fn x ->
      x * Map.get(freq, x, 0)
    end)
    |> Enum.sum()
  end

  @spec parse_input(Enumerable.t()) :: Enumerable.t()
  defp parse_input(input) do
    input
    |> Enum.map(fn line ->
      line
      |> String.split("   ", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> List.to_tuple()
    end)
    |> Enum.unzip()
  end
end
