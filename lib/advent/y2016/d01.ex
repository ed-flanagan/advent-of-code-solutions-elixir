defmodule Advent.Y2016.D01 do
  @moduledoc """
  https://adventofcode.com/2016/day/1
  """

  @typep directions :: [{integer(), non_neg_integer()}]

  @doc """
  How far is the shortest path to the destination?
  """
  @spec part_one(String.t()) :: non_neg_integer()
  def part_one(input) do
    {x, y, _d} =
      input
      |> parse_directions()
      |> Enum.reduce({0, 0, 0}, fn {rot, s}, {x, y, d} ->
        t = rotate(d, rot)

        case t do
          0 -> {x, y + s, t}
          90 -> {x + s, y, t}
          180 -> {x, y - s, t}
          270 -> {x - s, y, t}
        end
      end)

    manhattan_distance({0, 0}, {x, y})
  end

  @doc """
  How many blocks away is the first location you visit twice?
  """
  @spec part_two(String.t()) :: non_neg_integer()
  def part_two(input) do
    # |> (&((&1 -- Enum.uniq(&1)) |> Enum.uniq())).()
    {x, y} =
      input
      |> parse_directions()
      |> Enum.reduce_while({MapSet.new([{0, 0}]), {0, 0, 0}}, fn {rot, s}, {seen, {x, y, d}} ->
        t = rotate(d, rot)

        ns =
          Enum.map(1..s, fn s ->
            case t do
              0 -> {x, y + s}
              90 -> {x + s, y}
              180 -> {x, y - s}
              270 -> {x - s, y}
            end
          end)

        case Enum.find(ns, &MapSet.member?(seen, &1)) do
          nil ->
            seen = Enum.reduce(ns, seen, &MapSet.put(&2, &1))
            {x, y} = List.last(ns)
            {:cont, {seen, {x, y, t}}}

          repeat ->
            {:halt, repeat}
        end
      end)

    manhattan_distance({0, 0}, {x, y})
  end

  @spec parse_directions(String.t()) :: directions()
  defp parse_directions(input) do
    input
    |> String.split(",")
    |> Enum.map(&String.trim/1)
    |> Enum.map(fn <<t, n::binary>> ->
      turn =
        case t do
          ?R -> 90
          ?L -> -90
        end

      step = String.to_integer(n)

      {turn, step}
    end)
  end

  # Normalize rotation
  @spec rotate(integer(), integer()) :: non_neg_integer()
  defp rotate(start, degree) do
    rem(rem(start + degree, 360) + 360, 360)
  end

  # https://xlinux.nist.gov/dads/HTML/manhattanDistance.html
  defp manhattan_distance({x_a, y_a}, {x_b, y_b}) do
    abs(x_a - x_b) + abs(y_a - y_b)
  end
end
