defmodule Advent.Y2021.D05 do
  @moduledoc """
  https://adventofcode.com/2021/day/5
  """

  @doc """
  Consider only horizontal and vertical lines. At how many points do at least
  two lines overlap?
  """
  @spec part_one(Enumerable.t()) :: non_neg_integer()
  def part_one(input) do
    input
    |> parse_input()
    |> Stream.filter(fn {{x1, y1}, {x2, y2}} ->
      x1 == x2 || y1 == y2
    end)
    |> count_overlapping_coords()
  end

  @doc """
  """
  @spec part_two(Enumerable.t()) :: non_neg_integer()
  def part_two(input) do
    input
    |> parse_input()
    |> count_overlapping_coords()
  end

  @spec parse_input(Enumerable.t()) :: Enumerable.t()
  defp parse_input(input) do
    Stream.map(input, fn line ->
      [x1, y1, x2, y2] =
        Regex.run(~r/(\d+),(\d+)\s+\->\s+(\d+),(\d+)/, line, capture: :all_but_first)
        |> Enum.map(&String.to_integer/1)

      {{x1, y1}, {x2, y2}}
    end)
  end

  @spec count_overlapping_coords(Enumerable.t()) :: non_neg_integer()
  defp count_overlapping_coords(coords) do
    coords
    |> Stream.flat_map(fn
      {{x, y1}, {x, y2}} -> Enum.map(y1..y2, fn y -> {x, y} end)
      {{x1, y}, {x2, y}} -> Enum.map(x1..x2, fn x -> {x, y} end)
      {{x1, y1}, {x2, y2}} -> Enum.zip(x1..x2, y1..y2)
    end)
    |> Enum.frequencies()
    |> Enum.count(fn {_, count} -> count > 1 end)
  end
end
