defmodule Advent.Y2020.D11 do
  @moduledoc """
  https://adventofcode.com/2020/day/11
  """

  def part_one(input) do
    input
    |> init_grid()
    |> transform()
    |> Enum.count(fn {_, cell} -> cell == "#" end)
  end

  def part_two(input) do
    input
    |> init_grid()
    |> transform()
    |> Enum.count(fn {_, cell} -> cell == "#" end)
  end

  defp init_grid(input) do
    lines =
      input
      |> Stream.map(fn line ->
        line |> String.graphemes() |> Enum.with_index()
      end)
      |> Stream.with_index()

    for {line, row} <- lines,
        {cell, col} <- line,
        cell == "L" || cell == "#",
        reduce: %{} do
      grid -> Map.put(grid, {row, col}, cell)
    end
  end

  defp transform(grid) do
    new_grid =
      Enum.reduce(grid, %{}, fn
        {coord, "L"}, acc ->
          Map.put(acc, coord, if(num_adj(grid, coord) == 0, do: "#", else: "L"))

        {coord, "#"}, acc ->
          Map.put(acc, coord, if(num_adj(grid, coord) >= 4, do: "L", else: "#"))
      end)

    if Map.equal?(new_grid, grid) do
      new_grid
    else
      transform(new_grid)
    end
  end

  defp num_adj(grid, {x, y}) do
    [
      {x - 1, y - 1},
      {x - 1, y},
      {x - 1, y + 1},
      {x, y - 1},
      {x, y + 1},
      {x + 1, y - 1},
      {x + 1, y},
      {x + 1, y + 1}
    ]
    |> Enum.map(&Map.get(grid, &1))
    |> Enum.count(fn cell -> cell == "#" end)
  end
end
