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
    |> Enum.map(&safe?/1)
    |> Enum.count(&(&1 == :safe))
  end

  @doc """
  """
  @spec part_two(Enumerable.t()) :: any()
  def part_two(input) do
    input
    |> parse_input()
    |> Enum.map(&tolerant?/1)
    |> Enum.count(&(&1 == :safe))
  end

  defp safe?(report = [x, y | _]) do
    cond do
      x < y -> safe?(report, &Kernel.</2)
      x > y -> safe?(report, &Kernel.>/2)
      true -> :unsafe
    end
  end

  defp safe?([], _op), do: :safe
  defp safe?([_], _op), do: :safe

  defp safe?([x, y | rest], op) do
    if op.(x, y) && abs(y - x) in 1..3 do
      safe?([y | rest], op)
    else
      :unsafe
    end
  end

  defp tolerant?(report) do
    Stream.unfold(length(report), fn
      -1 -> nil
      idx -> {safe?(List.delete_at(report, idx)), idx - 1}
    end)
    |> Enum.find(:unsafe, &(&1 == :safe))
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
