defmodule Advent.Y2022.D14 do
  @moduledoc """
  https://adventofcode.com/2022/day/14
  """

  @doc """
  Using your scan, simulate the falling sand. How many units of sand come to
  rest before sand starts flowing into the abyss below?
  """
  @spec part_one(Enumerable.t()) :: integer()
  def part_one(input) do
    {grid, source, _} = parse_input(input)

    grid
    |> Stream.unfold(fn
      :void -> nil
      grid -> {grid, drop_sand(grid, source, source)}
    end)
    |> Enum.at(-1)
    |> Enum.count(fn {_, s} -> s == ?o end)
  end

  @doc """
  Using your scan, simulate the falling sand until the source of the sand
  becomes blocked. How many units of sand come to rest?
  """
  @spec part_two(Enumerable.t()) :: any()
  def part_two(input) do
    {grid, source, max_y} = parse_input(input)

    grid
    |> Stream.unfold(fn
      :full -> nil
      grid -> {grid, drop_sand(grid, source, source, max_y + 2)}
    end)
    |> Enum.at(-1)
    |> Enum.count(fn {_, s} -> s == ?o end)
  end

  defp parse_input(input) do
    # Read in lines
    grid =
      input
      |> Stream.flat_map(fn line ->
        line
        |> String.split([" -> ", ","])
        |> Enum.map(&String.to_integer/1)
        |> Enum.chunk_every(2)
        |> Enum.chunk_every(2, 1, :discard)
      end)
      |> Stream.flat_map(fn
        [[x, y1], [x, y2]] -> Enum.map(y1..y2, fn y -> {{x, y}, ?#} end)
        [[x1, y], [x2, y]] -> Enum.map(x1..x2, fn x -> {{x, y}, ?#} end)
      end)
      |> Map.new()

    # Set source
    grid = Map.put(grid, {500, 0}, ?+)

    # Window X values
    {{{min_x, _}, _}, {{max_x, _}, _}} = Enum.min_max_by(grid, fn {{x, _}, _} -> x end)
    {{{_, min_y}, _}, {{_, max_y}, _}} = Enum.min_max_by(grid, fn {{_, y}, _} -> y end)
    grid = Map.new(grid, fn {{x, y}, m} -> {{x - min_x, y}, m} end)

    # Fill window
    grid =
      for x <- 0..(max_x - min_x),
          y <- 0..(max_y - min_y),
          reduce: grid do
        grid -> Map.put_new(grid, {x, y}, ?.)
      end

    # Return grid with windowed source
    {grid, {500 - min_x, 0}, max_y - min_y}
  end

  defp drop_sand(grid, {x, y}, source, bottom \\ nil) do
    {below, left, right} = get_blocks(grid, {x, y}, bottom)

    cond do
      below == ?. -> drop_sand(grid, {x, y + 1}, source, bottom)
      block?(below) && left == ?. -> drop_sand(grid, {x - 1, y + 1}, source, bottom)
      block?(below) && right == ?. -> drop_sand(grid, {x + 1, y + 1}, source, bottom)
      grid[source] == ?o -> :full
      Enum.all?([below, left, right], &block?/1) -> Map.put(grid, {x, y}, ?o)
      true -> :void
    end
  end

  defp get_blocks(grid, {x, y}, bottom) do
    unknown =
      cond do
        bottom == nil -> nil
        y + 1 == bottom -> ?#
        true -> ?.
      end

    below = Map.get(grid, {x, y + 1}, unknown)
    left = Map.get(grid, {x - 1, y + 1}, unknown)
    right = Map.get(grid, {x + 1, y + 1}, unknown)

    {below, left, right}
  end

  defp block?(s), do: s == ?# || s == ?o

  # Experimental grid print
  #
  # defp print_grid(grid, emit? \\ IO.ANSI.enabled?()) do
  #   {{max_x, max_y}, _} = Enum.max_by(grid, &elem(&1, 0))
  #
  #   lines =
  #     for y <- 0..max_y do
  #       for x <- 0..max_x, into: [] do
  #         grid[{x, y}]
  #       end
  #     end
  #     |> Enum.map(fn row ->
  #       Enum.map_join(row, fn
  #         ?. -> IO.ANSI.format([:black_background, :black, "."], emit?)
  #         ?o -> IO.ANSI.format([:black_background, :yellow, "o"], emit?)
  #         ?# -> IO.ANSI.format([:white_background, :white, "#"], emit?)
  #         ?+ -> IO.ANSI.format([:red_background, :white, "+"], emit?)
  #       end)
  #     end)
  #     |> Enum.join("\n")
  #
  #   IO.puts(IO.ANSI.cursor(0, 0) <> lines)
  #   :timer.sleep(500)
  # end
end
