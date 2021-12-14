defmodule Advent.Y2021.D14 do
  @moduledoc """
  https://adventofcode.com/2021/day/14
  """

  @typep rules :: %{charlist() => {charlist(), charlist()}}

  @doc """
  Apply 10 steps of pair insertion to the polymer template and find the most
  and least common elements in the result. What do you get if you take the
  quantity of the most common element and subtract the quantity of the least
  common element?
  """
  @spec part_one(Enumerable.t()) :: non_neg_integer()
  def part_one(input) do
    input
    |> parse_input()
    |> solution(10)
  end

  @doc """
  Apply 40 steps of pair insertion to the polymer template and find the most
  and least common elements in the result. What do you get if you take the
  quantity of the most common element and subtract the quantity of the least
  common element?
  """
  @spec part_two(Enumerable.t()) :: non_neg_integer()
  def part_two(input) do
    input
    |> parse_input()
    |> solution(40)
  end

  @spec parse_input(Enumerable.t()) :: {map(), rules()}
  defp parse_input(input) do
    template =
      input
      |> Enum.at(0)
      |> String.to_charlist()
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.frequencies()

    rules =
      input
      |> Stream.drop(2)
      |> Stream.map(fn <<pair::binary-size(2), " -> ", insert>> ->
        pair = [a, b] = String.to_charlist(pair)
        {pair, {[a, insert], [insert, b]}}
      end)
      |> Map.new()

    {template, rules}
  end

  @spec solution({map(), rules()}, non_neg_integer()) :: non_neg_integer()
  defp solution({template, rules}, steps) do
    {{_, min}, {_, max}} =
      Stream.iterate(template, fn counts ->
        Enum.reduce(counts, %{}, fn {poly, count}, acc ->
          case Map.fetch(rules, poly) do
            {:ok, {a, b}} ->
              acc
              |> Map.update(a, count, &(&1 + count))
              |> Map.update(b, count, &(&1 + count))

            :error ->
              Map.update(acc, poly, count, &(&1 + count))
          end
        end)
      end)
      |> Enum.at(steps)
      |> Enum.reduce(%{}, fn {[_a, b], count}, acc ->
        # NOTE: I have a feeling while this solves the puzzle, it isn't
        #       technically correct
        Map.update(acc, b, count, &(&1 + count))
      end)
      |> Enum.min_max_by(&elem(&1, 1))

    max - min
  end
end
