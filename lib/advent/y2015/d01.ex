defmodule Advent.Y2015.D01 do
  @moduledoc """
  https://adventofcode.com/2015/day/1
  """

  @spec part_one(input :: charlist()) :: integer()
  def part_one(input) do
    Enum.reduce(input, 0, fn
      ?(, floor -> floor + 1
      ?), floor -> floor - 1
    end)
  end

  @spec part_two(input :: charlist()) :: integer()
  def part_two(input) do
    input
    |> Stream.with_index()
    |> Enum.reduce_while(0, fn
      {?), i}, 0 -> {:halt, i + 1}
      {?), _}, floor -> {:cont, floor - 1}
      {?(, _}, floor -> {:cont, floor + 1}
    end)
  end
end
