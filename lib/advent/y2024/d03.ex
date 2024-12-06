defmodule Advent.Y2024.D03 do
  @moduledoc """
  https://adventofcode.com/2024/day/3
  """

  @doc """
  """
  @spec part_one(Enumerable.t()) :: non_neg_integer()
  def part_one(input) do
    input
    |> parse_input()
    |> then(&Regex.scan(~r/mul\((\d+),(\d+)\)/, &1, capture: :all_but_first))
    |> Enum.map(&mult_pair/1)
    |> Enum.sum()
  end

  @doc """
  """
  @spec part_two(Enumerable.t()) :: non_neg_integer()
  def part_two(input) do
    input
    |> parse_input()
    |> then(&Regex.scan(~r/(mul)\((\d+),(\d+)\)|don't\(\)|do\(\)/, &1))
    |> Enum.map(fn
      [_, "mul" | nums] -> mult_pair(nums)
      ["don't()"] -> :disable
      ["do()"] -> :enable
    end)
    |> Enum.reduce({:enable, 0}, fn
      :enable, {_state, sum} -> {:enable, sum}
      :disable, {_state, sum} -> {:disable, sum}
      n, {:enable, sum} -> {:enable, sum + n}
      _n, acc -> acc
    end)
    |> elem(1)
  end

  defp mult_pair(pair = [_x, _y]) do
    pair
    |> Enum.map(&String.to_integer/1)
    |> Enum.reduce(&Kernel.*/2)
  end

  defp parse_input(input) do
    Enum.join(input)
  end
end
