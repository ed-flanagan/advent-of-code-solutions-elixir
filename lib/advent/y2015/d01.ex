defmodule Advent.Y2015.D01 do
  @moduledoc """
  https://adventofcode.com/2015/day/1
  """

  @doc """
  To what floor do the instructions take Santa?
  """
  @spec part_one(Enumerable.t()) :: integer()
  def part_one(input) do
    input
    |> parse_input()
    |> Enum.reduce(0, fn
      ?(, floor -> floor + 1
      ?), floor -> floor - 1
    end)
  end

  @doc """
  What is the position of the character that causes Santa to first enter the
  basement?
  """
  @spec part_two(Enumerable.t()) :: integer()
  def part_two(input) do
    input
    |> parse_input()
    |> Stream.with_index(1)
    |> Enum.reduce_while(0, fn
      {?), i}, 0 -> {:halt, i}
      {?), _}, floor -> {:cont, floor - 1}
      {?(, _}, floor -> {:cont, floor + 1}
    end)
  end

  @spec parse_input(Enumerable.t()) :: Enumerable.t()
  def parse_input(input), do: Stream.flat_map(input, &String.to_charlist/1)
end
