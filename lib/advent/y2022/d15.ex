defmodule Advent.Y2022.D15 do
  @moduledoc """
  https://adventofcode.com/2022/day/15
  """

  @doc """
  """
  @spec part_one(Enumerable.t()) :: any()
  def part_one(input) do
    {grid, _} = parse_input(input)

    print_grid(grid)

    # >  ......####B######################....
    # >      ..####B######################.. 

    # Enum.filter(grid, fn {{_, y}, s} ->
    #   y == 2_000_000 && (s == ?#)
    # end)
    # |> Enum.count()

    0
  end

  @doc """
  """
  @spec part_two(Enumerable.t()) :: any()
  def part_two(_input) do
    0
  end

  defp parse_input(input) do
    grid =
      input
      |> Enum.map(fn line ->
        [sx, sy, bx, by] =
          Regex.scan(~r/-?\d+/, line)
          |> List.flatten()
          |> Enum.map(&String.to_integer/1)

        sensor = {sx, sy} |> IO.inspect(label: "sensor")
        beacon = {bx, by}

        d = (abs(sx - bx) + abs(sy - by)) |> IO.inspect(label: "d")

        visible =
          for dx <- (-1 * d)..d do
            for dy <- (-1 * (d - abs(dx)))..(d - abs(dx)) do
              {sx + dx, sy + dy}
            end
          end
          |> List.flatten()
          |> Enum.sort()

        {sensor, beacon, visible}
      end)
      |> Enum.reduce(%{}, fn {sensor, beacon, visible}, acc ->
        acc =
          Enum.reduce(visible, acc, fn coord, acc ->
            Map.put_new(acc, coord, ?#)
          end)

        acc = Map.put(acc, sensor, ?S)
        Map.put(acc, beacon, ?B)
      end)

    # Window X values 
    {{{min_x, _}, _}, {{max_x, _}, _}} = Enum.min_max_by(grid, fn {{x, _}, _} -> x end)
    {{{_, min_y}, _}, {{_, max_y}, _}} = Enum.min_max_by(grid, fn {{_, y}, _} -> y end)
    # grid = Map.new(grid, fn {{x, y}, m} -> {{x - min_x, y - min_y}, m} end)

    # Fill window
    # for x <- 0..(max_x - min_x),
    #     y <- 0..(max_y - min_y),
    grid =
      for x <- min_x..max_x,
          y <- min_y..max_y,
          reduce: grid do
        grid -> Map.put_new(grid, {x, y}, ?.)
      end

    {grid, min_y}
  end

  defp print_grid(grid, emit? \\ IO.ANSI.enabled?()) do
    {{{min_x, min_y}, _}, {{max_x, max_y}, _}} = Enum.min_max_by(grid, &elem(&1, 0))

    for y <- min_y..max_y do
      for x <- min_x..max_x, into: [] do
        grid[{x, y}]
      end
    end
    |> Enum.map(fn row ->
      Enum.map_join(row, fn
        ?. ->
          "."

        ?# ->
          "#"

        ?B ->
          "B"

        ?S ->
          "S"
          # ?. -> IO.ANSI.format([:black_background, :black, "."], emit?)
          # ?o -> IO.ANSI.format([:black_background, :yellow, "o"], emit?)
          # ?# -> IO.ANSI.format([:white_background, :white, "#"], emit?)
          # ?+ -> IO.ANSI.format([:red_background, :white, "+"], emit?)
      end)
    end)
    |> Enum.each(&IO.puts/1)
  end
end
