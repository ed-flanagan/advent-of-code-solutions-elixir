defmodule Advent.Y2020.D03 do
  @moduledoc """
  https://adventofcode.com/2020/day/3
  """

  @spec part_one(rows :: Enumerable.t(String.t())) :: integer
  def part_one(rows) do
    count_trees(rows, 3, 1)
  end

  @spec part_two(rows :: Enumerable.t(String.t()), strategies :: Enumerable.t({integer, integer})) ::
          integer
  def part_two(rows, strategies) do
    Enum.reduce(strategies, 1, fn {right, down}, product ->
      product * count_trees(rows, right, down)
    end)
  end

  defp count_trees(rows, right, down) do
    # NOTE: this assumes each row is uniform in size. If that's not the case,
    # this would need to be computed for each row
    width = rows |> Enum.at(0) |> String.length()

    rows
    |> Stream.take_every(down)
    |> Stream.with_index()
    |> Enum.count(fn {row, idx} ->
      String.at(row, rem(right * idx, width)) == "#"
    end)
  end
end
