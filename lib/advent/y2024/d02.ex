defmodule Advent.Y2024.D02 do
  @moduledoc """
  https://adventofcode.com/2024/day/2
  """

  @doc """
  """
  @spec part_one(Enumerable.t()) :: non_neg_integer()
  def part_one(input) do
    input
    |> parse_input()
    |> Enum.map(&is_safe/1)
    |> Enum.sum()
  end

  @doc """
  """
  @spec part_two(Enumerable.t()) :: any()
  def part_two(_input) do
    0
  end

  defp is_safe(report = [x, y | _]) do
    cond do
      x < y -> is_safe(report, &Kernel.</2)
      x > y -> is_safe(report, &Kernel.>/2)
      true -> 0
    end
  end

  defp is_safe([], _op), do: 1
  defp is_safe([_], _op), do: 1

  defp is_safe([x, y | rest], op) do
    if op.(x, y) && abs(y - x) in 1..3 do
      is_safe([y | rest], op)
    else
      0
    end
  end

  @spec parse_input(Enumerable.t()) :: Enumerable.t()
  defp parse_input(input) do
    Enum.map(input, fn line ->
      Regex.scan(~r/\d+/, line)
      |> List.flatten()
      |> Enum.map(&String.to_integer/1)
    end)
  end
end
