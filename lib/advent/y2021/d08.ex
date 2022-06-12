defmodule Advent.Y2021.D08 do
  @moduledoc """
  https://adventofcode.com/2021/day/8
  """

  @doc """
  In the output values, how many times do digits 1, 4, 7, or 8 appear?
  """
  @spec part_one(Enumerable.t()) :: non_neg_integer()
  def part_one(input) do
    input
    |> parse_input()
    |> Stream.flat_map(fn {_signal, output} -> output end)
    |> Stream.filter(fn output ->
      Enum.any?([2, 3, 4, 7], &(MapSet.size(output) == &1))
    end)
    |> Enum.count()
  end

  @doc """
  For each entry, determine all of the wire/segment connections and decode the
  four-digit output values. What do you get if you add up all of the output
  values?
  """
  # Assumed properties:
  # Has at least one of every number
  @spec part_two(Enumerable.t()) :: non_neg_integer()
  def part_two(input) do
    input
    |> parse_input()
    |> Stream.map(fn {signal, output} ->
      solution = solve_signals(signal ++ output)

      output
      |> Enum.map(&solution[&1])
      |> Integer.undigits()
    end)
    |> Enum.sum()
  end

  @spec parse_input(Enumerable.t()) :: Enumerable.t()
  defp parse_input(input) do
    input
    |> Stream.map(fn entry ->
      [signal, output] = String.split(entry, " | ", trim: true, parts: 2)
      {parse_patterns(signal), parse_patterns(output)}
    end)
  end

  @spec parse_patterns(String.t()) :: [MapSet.t()]
  defp parse_patterns(patterns) do
    patterns
    |> String.split()
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&MapSet.new/1)
  end

  @spec solve_signals([MapSet.t()]) :: %{MapSet.t() => non_neg_integer()}
  defp solve_signals(signals) do
    by_size =
      signals
      |> Enum.group_by(&MapSet.size/1)
      |> Map.new(fn {key, seqs} -> {key, Enum.uniq(seqs)} end)

    # unique
    [one] = by_size[2]
    [four] = by_size[4]
    [seven] = by_size[3]
    [eight] = by_size[7]

    # group 5
    two = Enum.find(by_size[5], &(MapSet.size(MapSet.difference(four, &1)) == 2))
    three = Enum.find(by_size[5], &(MapSet.size(MapSet.difference(&1, one)) == 3))
    [five] = by_size[5] -- [two, three]

    # group 6
    six = Enum.find(by_size[6], &(MapSet.size(MapSet.difference(&1, one)) == 5))
    nine = Enum.find(by_size[6], &(MapSet.size(MapSet.difference(&1, four)) == 2))
    [zero] = by_size[6] -- [six, nine]

    [zero, one, two, three, four, five, six, seven, eight, nine]
    |> Enum.with_index()
    |> Map.new()
  end
end
