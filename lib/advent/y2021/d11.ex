defmodule Advent.Y2021.D11 do
  @moduledoc """
  https://adventofcode.com/2021/day/11
  """

  @typep point :: {non_neg_integer(), non_neg_integer()}
  @typep grid :: %{point => non_neg_integer()}

  @doc """
  Given the starting energy levels of the dumbo octopuses in your cavern,
  simulate 100 steps. How many total flashes are there after 100 steps?
  """
  @spec part_one(Enumerable.t(), non_neg_integer()) :: non_neg_integer()
  def part_one(input, steps) do
    input
    |> parse_input()
    |> Stream.unfold(&step/1)
    |> Stream.take(steps)
    |> Enum.sum()
  end

  @doc """
  What is the first step during which all octopuses flash?
  """
  @spec part_two(Enumerable.t()) :: non_neg_integer()
  def part_two(input) do
    grid = parse_input(input)
    grid_size = map_size(grid)

    grid
    |> Stream.unfold(&step/1)
    |> Stream.with_index(1)
    |> Enum.find(fn {flashes, _step} -> flashes == grid_size end)
    |> elem(1)
  end

  @spec parse_input(Enumerable.t()) :: grid()
  defp parse_input(input) do
    input
    |> Stream.with_index()
    |> Stream.flat_map(fn {line, row} ->
      line
      |> String.graphemes()
      |> Enum.map(&String.to_integer/1)
      |> Enum.with_index()
      |> Enum.map(fn {energy, col} ->
        {{col, row}, energy}
      end)
    end)
    |> Map.new()
  end

  @spec step(grid()) :: {non_neg_integer(), grid()}
  defp step(grid) do
    grid = Map.map(grid, fn {_, e} -> rem(e + 1, 10) end)

    {flash_points, num_flashes} =
      Enum.reduce(grid, {[], 0}, fn
        {point, 0}, {acc, n} -> {[point | acc], n + 1}
        _, {acc, n} -> {acc, n}
      end)

    do_step(grid, flash_points, num_flashes)
  end

  @spec do_step(grid(), [point()], non_neg_integer()) :: {non_neg_integer(), grid()}
  defp do_step(grid, [], num_flashes), do: {num_flashes, grid}

  defp do_step(grid, flash_points, total_flashes) do
    {grid, flash_points, num_flashes} =
      flash_points
      |> Enum.flat_map(&neighbors(grid, &1))
      |> Enum.reduce({grid, [], 0}, fn point, {grid, acc, n} ->
        {old, grid} =
          Map.get_and_update(grid, point, fn
            0 -> {0, 0}
            e -> {e, rem(e + 1, 10)}
          end)

        if old == 9 do
          {grid, [point | acc], n + 1}
        else
          {grid, acc, n}
        end
      end)

    do_step(grid, flash_points, total_flashes + num_flashes)
  end

  @spec neighbors(grid(), point()) :: [point()]
  defp neighbors(grid, {col, row}) do
    # > Multiple generators can also be used to calculate the cartesian product
    # > of two lists...
    # -- https://elixir-lang.org/getting-started/comprehensions.html#generators-and-filters
    for(x <- -1..1, y <- -1..1, {x, y} != {0, 0}, do: {col + x, row + y})
    |> Enum.filter(&Map.has_key?(grid, &1))
  end
end
