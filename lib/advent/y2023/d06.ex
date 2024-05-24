defmodule Advent.Y2023.D06 do
  @moduledoc """
  https://adventofcode.com/2023/day/6
  """

  @doc """
  """
  @spec part_one(Enumerable.t()) :: any()
  def part_one(input) do
    input
    |> parse_input_01()
    |> Enum.map(fn {t, d} ->
      narrow(t, d, 1, t - 1)
    end)
    |> Enum.product()
  end

  @doc """
  """
  @spec part_two(Enumerable.t()) :: any()
  def part_two(input) do
    [time, distance] = parse_input_02(input)
    narrow(time, distance, 1, time - 1)
  end

  defp narrow(time, to_beat, lo, hi) do
    lo_d = dist(lo, time)
    hi_d = dist(hi, time)

    if lo_d > to_beat && hi_d > to_beat do
      Range.size(lo..hi)
    else
      lo = if lo_d <= to_beat, do: lo + 1, else: lo
      hi = if hi_d <= to_beat, do: hi - 1, else: hi
      narrow(time, to_beat, lo, hi)
    end
  end

  defp dist(hold, time) do
    hold * (time - hold)
  end

  @spec parse_input_01(Enumerable.t()) :: Enumerable.t()
  defp parse_input_01(input) do
    input
    |> Enum.map(fn line ->
      line
      |> String.trim()
      |> String.split()
      |> tl()
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.zip()
  end

  @spec parse_input_02(Enumerable.t()) :: Enumerable.t()
  defp parse_input_02(input) do
    input
    |> Enum.map(fn line ->
      line
      |> String.trim()
      |> String.split()
      |> tl()
      |> Enum.map(&String.to_integer/1)
      |> Enum.flat_map(&Integer.digits/1)
      |> Integer.undigits()
    end)
  end
end
