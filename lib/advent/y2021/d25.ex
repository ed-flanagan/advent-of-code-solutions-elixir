defmodule Advent.Y2021.D25 do
  @moduledoc """
  https://adventofcode.com/2021/day/25
  """

  @typep direction :: :> | :v
  @typep coord :: {integer(), integer()}
  @typep grid :: %{coord() => direction()}

  @doc """
  Find somewhere safe to land your submarine. What is the first step on which
  no sea cucumbers move?
  """
  @spec part_one(Enumerable.t()) :: non_neg_integer()
  def part_one(input) do
    input
    |> parse_input()
    |> Stream.iterate(&step/1)
    |> Stream.chunk_every(2, 1)
    |> Stream.with_index(1)
    |> Enum.find_value(fn {[g1, g2], turn} ->
      if g1 == g2, do: turn
    end)
  end

  @doc """
  """
  @spec part_two(any()) :: any()
  def part_two(_input) do
    0
  end

  def parse_input(input) do
    grid =
      input
      |> Stream.with_index()
      |> Stream.flat_map(fn {line, row} ->
        line
        |> String.graphemes()
        |> Enum.with_index()
        |> Enum.map(fn {x, col} -> {x, {col, row}} end)
      end)
      |> Stream.reject(fn {x, _} -> x == "." end)
      |> Stream.map(fn
        {">", coord} -> {coord, :>}
        {"v", coord} -> {coord, :v}
      end)
      |> Map.new()

    {{max_x, _}, _} = Enum.max_by(grid, fn {{x, _}, _} -> x end)
    {{_, max_y}, _} = Enum.max_by(grid, fn {{_, y}, _} -> y end)

    {grid, {max_x, max_y}}
  end

  defp step({grid, {max_x, max_y}}) do
    # Move east herd
    grid =
      grid
      |> Enum.map(fn
        self = {{x, y}, :>} ->
          shift = {rem(x + 1, max_x + 1), y}

          if Map.has_key?(grid, shift) do
            self
          else
            {shift, :>}
          end

        self ->
          self
      end)
      |> Map.new()

    # Move south herd
    grid =
      grid
      |> Enum.map(fn
        self = {{x, y}, :v} ->
          shift = {x, rem(y + 1, max_y + 1)}

          if Map.has_key?(grid, shift) do
            self
          else
            {shift, :v}
          end

        self ->
          self
      end)
      |> Map.new()

    {grid, {max_x, max_y}}
  end

  @doc """
  Print a given grid
  """
  @spec print_grid({grid(), coord()}) :: :ok
  def print_grid({grid, {max_x, max_y}}) do
    for y <- 0..max_y do
      for x <- 0..max_x, into: "" do
        case Map.get(grid, {x, y}) do
          :> -> ">"
          :v -> "v"
          nil -> "."
        end
      end
    end
    |> Enum.join("\n")
    |> IO.puts()
  end
end
