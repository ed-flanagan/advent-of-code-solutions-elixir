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
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split/1)
    |> Stream.map(fn p -> Enum.map(p, &String.to_integer/1) end)
    |> Stream.map(&List.to_tuple/1)
    |> Enum.unzip()
  end
end
