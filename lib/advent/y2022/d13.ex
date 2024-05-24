defmodule Advent.Y2022.D13 do
  @moduledoc """
  https://adventofcode.com/2022/day/13
  """

  @divider_packets [[[2]], [[6]]]

  @doc """
  Determine which pairs of packets are already in the right order. What is the
  sum of the indices of those pairs?
  """
  @spec part_one(Enumerable.t()) :: non_neg_integer()
  def part_one(input) do
    input
    |> parse_input()
    |> Stream.chunk_every(2)
    |> Stream.with_index(1)
    |> Stream.filter(fn {[one, two], _} -> sorter(one, two) end)
    |> Stream.map(fn {_, idx} -> idx end)
    |> Enum.sum()
  end

  @doc """
  Organize all of the packets into the correct order. What is the decoder key
  for the distress signal?
  """
  @spec part_two(Enumerable.t()) :: non_neg_integer()
  def part_two(input) do
    input
    |> parse_input()
    |> Stream.concat(@divider_packets)
    |> Enum.sort(&sorter/2)
    |> Enum.with_index(1)
    |> Enum.filter(fn {packet, _} -> packet in @divider_packets end)
    |> then(fn [{_, idx1}, {_, idx2}] -> idx1 * idx2 end)
  end

  @spec parse_input(Enumerable.t()) :: Enumerable.t()
  defp parse_input(input) do
    input
    |> Stream.reject(&(&1 == ""))
    |> Stream.map(&Code.eval_string/1)
    |> Stream.map(&elem(&1, 0))
  end

  @spec sorter([integer()], [integer()]) :: boolean() | :cont
  defp sorter([], []), do: :cont
  defp sorter([], _), do: true
  defp sorter(_, []), do: false

  defp sorter([x | x_tail], [x | y_tail]), do: sorter(x_tail, y_tail)

  defp sorter([x | x_tail], [y | y_tail]) do
    case sorter(x, y) do
      :cont -> sorter(x_tail, y_tail)
      res -> res
    end
  end

  defp sorter(x = [_ | _], y), do: sorter(x, [y])
  defp sorter(x, y = [_ | _]), do: sorter([x], y)

  defp sorter(x, x), do: :cont
  defp sorter(x, y), do: x < y
end
