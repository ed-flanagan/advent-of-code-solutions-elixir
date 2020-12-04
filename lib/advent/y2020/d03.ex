defmodule Advent.Y2020.D03 do
  def part_one(rows) do
    traverse(rows, 3, 1)
  end

  def part_two(rows, strategies) do
    Enum.reduce(strategies, 1, fn {right, down}, product ->
      product * traverse(rows, right, down)
    end)
  end

  defp traverse(rows, right, down) do
    # NOTE: this assumes each row is uniform in size. If that's not the case,
    # this would need to be computed for each row
    width = rows |> Enum.at(0) |> String.length()

    rows
    |> Stream.take_every(down)
    |> Stream.with_index()
    |> Stream.map(fn {row, idx} -> String.at(row, rem(right * idx, width)) end)
    |> Enum.count(&("#" == &1))
  end
end
