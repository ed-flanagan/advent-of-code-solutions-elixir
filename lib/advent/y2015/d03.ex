defmodule Advent.Y2015.D03 do
  @moduledoc """
  https://adventofcode.com/2015/day/3
  """

  @spec part_one(Enumerable.t()) :: integer()
  def part_one(input) do
    input
    |> parse_input()
    |> deliver_presents()
    |> MapSet.size()
  end

  @spec part_two(Enumerable.t()) :: integer()
  def part_two(input) do
    steps = parse_input(input)

    santa_seen = steps |> Stream.take_every(2) |> deliver_presents()
    robo_seen = steps |> Stream.drop(1) |> Stream.take_every(2) |> deliver_presents()

    MapSet.union(santa_seen, robo_seen) |> MapSet.size()
  end

  defp deliver_presents(steps) do
    {seen, _} =
      Enum.reduce(steps, {MapSet.new([{0, 0}]), {0, 0}}, fn step, {seen, {x, y}} ->
        pos =
          case step do
            ?^ -> {x, y + 1}
            ?v -> {x, y - 1}
            ?> -> {x + 1, y}
            ?< -> {x - 1, y}
          end

        {MapSet.put(seen, pos), pos}
      end)

    seen
  end

  @spec parse_input(Enumerable.t()) :: Enumerable.t()
  defp parse_input(input), do: Stream.flat_map(input, &String.to_charlist/1)
end
