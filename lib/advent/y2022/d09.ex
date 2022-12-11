defmodule Advent.Y2022.D09 do
  @moduledoc """
  https://adventofcode.com/2022/day/9
  """

  @typep coord :: {integer(), integer()}
  @typep dir :: :U | :D | :L | :R

  @doc """
  Simulate your complete hypothetical series of motions. How many positions
  does the tail of the rope visit at least once?
  """
  @spec part_one(Enumerable.t()) :: non_neg_integer()
  def part_one(input) do
    solve(input, 2)
  end

  @doc """
  Simulate your complete series of motions on a larger rope with ten knots.
  How many positions does the tail of the rope visit at least once?
  """
  @spec part_two(Enumerable.t()) :: non_neg_integer()
  def part_two(input) do
    solve(input, 10)
  end

  @spec parse_input(Enumerable.t()) :: Enumerable.t()
  defp parse_input(input) do
    Stream.flat_map(input, fn motion ->
      [dir, steps] = String.split(motion)
      List.duplicate(String.to_existing_atom(dir), String.to_integer(steps))
    end)
  end

  @spec solve(Enumerable.t(), pos_integer()) :: pos_integer()
  defp solve(input, knots) when knots >= 2 do
    input
    |> parse_input()
    |> Stream.scan(List.duplicate({0, 0}, knots), &move/2)
    |> Stream.map(&List.last/1)
    |> MapSet.new()
    |> MapSet.size()
  end

  @spec move(dir(), [coord()]) :: [coord()]
  defp move(dir, rope = [head | _tail]) do
    Enum.scan(rope, shift(dir, head), &step/2)
  end

  @spec step(coord(), coord()) :: coord()
  defp step({tx, ty}, {hx, hy}) do
    case {hx - tx, hy - ty} do
      {dx, dy} when abs(dx) >= 2 and abs(dy) >= 2 -> {norm(hx, tx), norm(hy, ty)}
      {_, 2} -> {hx, hy - 1}
      {_, -2} -> {hx, hy + 1}
      {-2, _} -> {hx + 1, hy}
      {2, _} -> {hx - 1, hy}
      _ -> {tx, ty}
    end
  end

  @spec shift(dir(), coord()) :: coord()
  defp shift(dir, {x, y}) do
    case dir do
      :U -> {x, y + 2}
      :D -> {x, y - 2}
      :L -> {x - 2, y}
      :R -> {x + 2, y}
    end
  end

  @spec norm(integer(), integer()) :: integer()
  defp norm(t, t), do: t
  defp norm(h, t) when h < t, do: t - 1
  defp norm(h, t) when h > t, do: t + 1
end
