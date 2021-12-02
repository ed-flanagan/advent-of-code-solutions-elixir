defmodule Advent.Y2021.D02 do
  @moduledoc """
  https://adventofcode.com/2021/day/2
  """

  @doc """
  What do you get if you multiply your final horizontal position by your final
  depth?
  """
  @spec part_one(Enumerable.t()) :: integer()
  def part_one(input) do
    {hoz, dpt} =
      input
      |> parse_input()
      |> Enum.reduce({0, 0}, fn
        {"forward", n}, {h, d} -> {h + n, d}
        {"down", n}, {h, d} -> {h, d + n}
        {"up", n}, {h, d} -> {h, d - n}
      end)

    hoz * dpt
  end

  @doc """
  What do you get if you multiply your final horizontal position by your final
  depth?
  """
  @spec part_two(Enumerable.t()) :: integer()
  def part_two(input) do
    {hoz, dpt, _aim} =
      input
      |> parse_input()
      |> Enum.reduce({0, 0, 0}, fn
        {"forward", n}, {h, d, a} -> {h + n, d + n * a, a}
        {"down", n}, {h, d, a} -> {h, d, a + n}
        {"up", n}, {h, d, a} -> {h, d, a - n}
      end)

    hoz * dpt
  end

  @spec parse_input(Enumerable.t()) :: Enumerable.t()
  defp parse_input(input) do
    input
    |> Stream.map(&String.split/1)
    |> Stream.map(fn [dir, unit] ->
      {dir, String.to_integer(unit)}
    end)
  end
end
