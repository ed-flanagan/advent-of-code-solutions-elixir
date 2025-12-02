defmodule Advent.Y2022.D08 do
  @moduledoc """
  https://adventofcode.com/2022/day/8
  """

  @doc """
  Consider your map; how many trees are visible from outside the grid?
  """
  @spec part_one(Enumerable.t()) :: non_neg_integer()
  def part_one(input) do
    {grid, dim = {dw, dh}, middle} = parse_input(input)

    middle
    |> Enum.count(&visible?(grid, dim, &1))
    |> Kernel.+(2 * (dw + dh))
  end

  @doc """
  Consider each tree on your map. What is the highest scenic score possible for
  any tree?
  """
  @spec part_two(Enumerable.t()) :: non_neg_integer()
  def part_two(input) do
    {grid, dim, middle} = parse_input(input)

    middle
    |> Enum.map(&scenic_score(grid, dim, &1))
    |> Enum.max()
  end

  defp parse_input(input) do
    grid =
      input
      |> Stream.with_index()
      |> Stream.flat_map(fn {heights, row} ->
        heights
        |> String.to_charlist()
        |> Enum.map(&(&1 - 48))
        |> Enum.with_index()
        |> Enum.map(fn {h, col} -> {{col, row}, h} end)
      end)
      |> Map.new()

    dim = {dw, dh} = grid |> Map.keys() |> Enum.max()

    middle =
      for x <- 1..(dw - 1),
          y <- 1..(dh - 1) do
        {x, y}
      end

    {grid, dim, middle}
  end

  defp tree_lines({dw, dh}, {tx, ty}) do
    n = for y <- (ty - 1)..0//-1, do: {tx, y}
    s = for y <- (ty + 1)..dh, do: {tx, y}
    e = for x <- (tx + 1)..dw, do: {x, ty}
    w = for x <- (tx - 1)..0//-1, do: {x, ty}

    [n, s, e, w]
  end

  defp visible?(grid, dim, tree) do
    tree_lines(dim, tree)
    |> Enum.any?(fn line ->
      Enum.all?(line, &(grid[&1] < grid[tree]))
    end)
  end

  defp scenic_score(grid, dim, tree) do
    tree_lines(dim, tree)
    |> Enum.map(
      &Enum.reduce_while(&1, 0, fn t, acc ->
        if grid[t] < grid[tree] do
          {:cont, acc + 1}
        else
          {:halt, acc + 1}
        end
      end)
    )
    |> Enum.product()
  end
end
