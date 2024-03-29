defmodule Advent.Y2020.D09 do
  @moduledoc """
  https://adventofcode.com/2020/day/9
  """

  def part_one(input, buffer_size) do
    input
    |> Stream.map(&String.to_integer/1)
    |> find_bad_value(buffer_size)
  end

  def part_two(input, buffer_size) do
    values = input |> Stream.map(&String.to_integer/1) |> Enum.to_list()

    values
    |> find_bad_value(buffer_size)
    |> find_bad_range(values)
    |> Enum.min_max()
    |> then(fn {min, max} -> min + max end)
  end

  defp find_bad_value(values, buffer_size) do
    Enum.reduce_while(values, [], fn
      next, buffer when length(buffer) < buffer_size ->
        {:cont, [next | buffer]}

      next, buffer ->
        if two_sum(buffer, next) do
          {:cont, [next | buffer |> Enum.reverse() |> tl() |> Enum.reverse()]}
        else
          {:halt, next}
        end
    end)
  end

  @spec two_sum([integer()], integer()) :: boolean()
  defp two_sum(vals, target) do
    do_two_sum(vals, target, MapSet.new())
  end

  @spec do_two_sum([integer()], integer(), MapSet.t()) :: boolean()
  defp do_two_sum([], _target, _seen), do: false

  defp do_two_sum([x | tail], target, seen) do
    if (target - x) in seen do
      true
    else
      do_two_sum(tail, target, MapSet.put(seen, x))
    end
  end

  defp find_bad_range(target, values) do
    do_find_contiguous_range(target, values, [], 0)
  end

  defp do_find_contiguous_range(target, _values, range, sum) when target == sum do
    range
  end

  defp do_find_contiguous_range(target, values, range, sum) when sum > target do
    trunc_values = range |> Enum.reverse() |> tl() |> Enum.concat(values)
    do_find_contiguous_range(target, trunc_values, [], 0)
  end

  defp do_find_contiguous_range(_target, [], _range, _sum), do: []

  defp do_find_contiguous_range(target, [x | tail], range, sum) do
    do_find_contiguous_range(target, tail, [x | range], sum + x)
  end
end
