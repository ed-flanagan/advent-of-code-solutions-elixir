defmodule Advent.Y2023.D03 do
  @moduledoc """
  https://adventofcode.com/2023/day/3
  """

  @doc """
  What is the sum of all of the part numbers in the engine schematic?
  """
  @spec part_one(Enumerable.t()) :: pos_integer()
  def part_one(input) do
    {parts, symbols} = parse_input(input)

    parts
    |> Enum.filter(fn {{x_s..x_e//_, y}, _num} ->
      {{x1, y1}, {x2, y2}} = {{x_s - 1, y - 1}, {x_e + 1, y + 1}}

      for x <- x1..x2,
          y <- y1..y2 do
        {x, y}
      end
      |> Enum.any?(&Map.has_key?(symbols, &1))
    end)
    |> Enum.map(fn {_coords, num} -> num end)
    |> Enum.sum()
  end

  @doc """
  What is the sum of all of the gear ratios in your engine schematic?
  """
  @spec part_two(Enumerable.t()) :: pos_integer()
  def part_two(input) do
    {parts, symbols} = parse_input(input)

    symbols
    |> Enum.filter(fn {_coords, symbol} -> symbol == ?* end)
    |> Enum.map(fn {{x, y}, _} ->
      {{x1, y1}, {x2, y2}} = {{x - 1, y - 1}, {x + 1, y + 1}}

      for x <- x1..x2,
          y <- y1..y2 do
        {x, y}
      end
      |> Enum.map(fn {x_s, y_s} ->
        Enum.filter(parts, fn {{x_p, y_p}, _num} ->
          x_s in x_p and y_s == y_p
        end)
      end)
      |> List.flatten()
      |> Enum.uniq()
      |> Enum.map(fn {_coords, num} -> num end)
    end)
    |> Enum.filter(&(length(&1) >= 2))
    |> Enum.map(&Enum.product/1)
    |> Enum.sum()
  end

  @spec parse_input(Enumerable.t()) :: Enumerable.t()
  defp parse_input(input) do
    input
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_charlist/1)
    |> Stream.with_index()
    |> Stream.map(fn {row, y} ->
      # Make chunks of digits and symbols, then split the two categories
      {parts, symbols} =
        row
        |> Enum.with_index()
        |> Enum.chunk_by(fn {c, _} ->
          c in ?0..?9
        end)
        |> Enum.split_with(fn [{n, _} | _rest] ->
          n in ?0..?9
        end)

      parts =
        Enum.map(parts, fn digits ->
          num =
            digits
            |> Enum.into([], fn {d, _} -> d end)
            |> List.to_integer()

          {{_, x1}, {_, x2}} = Enum.min_max_by(digits, fn {_, x} -> x end)

          {{x1..x2, y}, num}
        end)

      symbols =
        symbols
        |> List.flatten()
        |> Enum.reject(fn {s, _} -> s == ?. end)
        |> Enum.map(fn {s, x} -> {{x, y}, s} end)

      {parts, symbols}
    end)
    |> Enum.reduce({%{}, %{}}, fn {parts, symbols}, {p_acc, s_acc} ->
      {Enum.into(parts, p_acc), Enum.into(symbols, s_acc)}
    end)
  end
end
