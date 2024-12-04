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
    |> Enum.count(&safe?/1)
  end

  @doc """
  """
  @spec part_two(Enumerable.t()) :: non_neg_integer()
  def part_two(input) do
    input
    |> parse_input()
    |> Enum.count(&tolerant?/1)
  end

  defp safe?([x, x | _]), do: false

  defp safe?(report = [x, y | _]) do
    op = if x < y, do: &Kernel.</2, else: &Kernel.>/2
    safe?(report, op)
  end

  defp safe?([], _op), do: true
  defp safe?([_], _op), do: true

  defp safe?([x, y | rest], op) do
    if op.(x, y) && abs(y - x) in 1..3 do
      safe?([y | rest], op)
    else
      false
    end
  end

  defp tolerant?(report) do
    # Brute force find
    Stream.unfold(length(report), fn
      -1 -> nil
      idx -> {safe?(List.delete_at(report, idx)), idx - 1}
    end)
    |> Enum.any?()
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
