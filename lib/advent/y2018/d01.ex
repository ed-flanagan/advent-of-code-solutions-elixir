defmodule Advent.Y2018.D01 do
  @moduledoc """
  https://adventofcode.com/2018/day/1
  """

  @spec part_one(Enumerable.t()) :: integer()
  def part_one(input), do: Enum.sum(input)

  @spec part_two(Enumerable.t()) :: integer()
  def part_two(input) do
    input
    |> Stream.cycle()
    |> Enum.reduce_while({0, MapSet.new([0])}, fn inc, {sum, seen} ->
      sum = sum + inc

      if sum in seen do
        {:halt, sum}
      else
        {:cont, {sum, MapSet.put(seen, sum)}}
      end
    end)
  end
end
