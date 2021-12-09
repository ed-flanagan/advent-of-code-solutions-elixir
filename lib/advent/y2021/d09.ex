defmodule Advent.Y2021.D09 do
  @moduledoc """
  https://adventofcode.com/2021/day/9
  """

  @typep point :: {non_neg_integer(), non_neg_integer()}
  @typep grid :: %{point() => non_neg_integer()}

  @doc """
  Find all of the low points on your heightmap. What is the sum of the risk
  levels of all low points on your heightmap?
  """
  @spec part_one(Enumerable.t()) :: non_neg_integer()
  def part_one(input) do
    grid = parse_input(input)

    grid
    |> find_low_points()
    |> Enum.map(&risk_level(grid, &1))
    |> Enum.sum()
  end

  @doc """
  What do you get if you multiply together the sizes of the three largest
  basins?
  """
  @spec part_two(Enumerable.t()) :: non_neg_integer()
  def part_two(input) do
    grid = parse_input(input)

    grid
    |> find_low_points()
    |> Enum.map(&find_basin(grid, &1))
    |> Enum.map(&MapSet.size/1)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.reduce(&*/2)
  end

  @spec parse_input(Enumerable.t()) :: grid()
  defp parse_input(input) do
    input
    |> Stream.map(fn line ->
      line
      |> String.graphemes()
      |> Enum.map(&String.to_integer/1)
      |> Enum.with_index()
    end)
    |> Stream.with_index()
    |> Enum.reduce(Map.new(), fn {heights, row}, grid ->
      Enum.reduce(heights, grid, fn {height, col}, grid ->
        Map.put(grid, {col, row}, height)
      end)
    end)
  end

  @spec find_low_points(grid()) :: [point()]
  defp find_low_points(grid) do
    Enum.filter(grid, fn {point, height} ->
      adj_heights = Enum.map(get_adjacent_points(grid, point), &Map.get(grid, &1, :infinity))
      Enum.all?(adj_heights, &(&1 > height))
    end)
    |> Enum.map(fn {point, _height} -> point end)
  end

  @spec get_adjacent_points(grid(), point()) :: [point()]
  defp get_adjacent_points(grid, {col, row}) do
    [{col - 1, row}, {col + 1, row}, {col, row - 1}, {col, row + 1}]
    |> Enum.filter(&Map.has_key?(grid, &1))
  end

  @spec risk_level(grid(), point()) :: non_neg_integer()
  defp risk_level(grid, point) do
    grid[point] + 1
  end

  @spec find_basin(grid(), point()) :: MapSet.t()
  defp find_basin(grid, low_point) do
    do_find_basin(grid, [low_point], MapSet.new())
  end

  @spec do_find_basin(grid(), [point()], MapSet.t()) :: MapSet.t()
  defp do_find_basin(_grid, [], seen), do: seen

  defp do_find_basin(grid, [head | todo], seen) do
    adj =
      get_adjacent_points(grid, head)
      |> Enum.reject(&MapSet.member?(seen, &1))
      |> Enum.filter(fn ap ->
        grid[ap] > grid[head] && grid[ap] != 9
      end)

    do_find_basin(grid, todo ++ adj, MapSet.put(seen, head))
  end
end
