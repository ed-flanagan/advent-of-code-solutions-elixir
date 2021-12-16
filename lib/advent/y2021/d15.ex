defmodule Advent.Y2021.D15 do
  @moduledoc """
  https://adventofcode.com/2021/day/15
  """

  @typep point :: {non_neg_integer(), non_neg_integer()}
  @typep risk :: non_neg_integer()
  @typep risk_level :: 1..9
  @typep risk_matrix :: %{point() => risk_level()}

  @doc """
  What is the lowest total risk of any path from the top left to the bottom
  right?
  """
  @spec part_one(Enumerable.t()) :: risk()
  def part_one(input) do
    input
    |> parse_input()
    |> lowest_risk()
  end

  @doc """
  Using the full map, what is the lowest total risk of any path from the top
  left to the bottom right?
  """
  @spec part_two(Enumerable.t()) :: risk()
  def part_two(input) do
    input
    |> parse_input()
    |> enlarge()
    |> lowest_risk()
  end

  @spec parse_input(Enumerable.t()) :: risk_matrix()
  defp parse_input(input) do
    input
    |> Stream.map(fn line ->
      line
      |> String.graphemes()
      |> Enum.map(&String.to_integer/1)
      |> Enum.with_index()
    end)
    |> Stream.with_index()
    |> Stream.flat_map(fn {row, y} ->
      Enum.map(row, fn {risk_level, x} ->
        {{x, y}, risk_level}
      end)
    end)
    |> Map.new()
  end

  @spec enlarge(risk_matrix()) :: risk_matrix()
  defp enlarge(risk_matrix) do
    {{{x_min, y_min}, _}, {{x_max, y_max}, _}} =
      Enum.min_max_by(risk_matrix, fn {point, _} -> point end)

    for {{x, y}, risk} <- risk_matrix,
        x_inc <- 0..4,
        y_inc <- 0..4,
        reduce: %{} do
      acc ->
        x_n = x + x_inc * (x_max - x_min + 1)
        y_n = y + y_inc * (y_max - y_min + 1)
        risk = rem(risk + x_inc + y_inc - 1, 9) + 1

        Map.put(acc, {x_n, y_n}, risk)
    end
  end

  @spec neighbors(risk_matrix(), point()) :: MapSet.t()
  defp neighbors(risk_matrix, {col, row}) do
    [{-1, 0}, {1, 0}, {0, -1}, {0, 1}]
    |> Enum.map(fn {x, y} -> {col + x, row + y} end)
    |> Enum.filter(&Map.has_key?(risk_matrix, &1))
    |> MapSet.new()
  end

  # Dijkstra's algorithm, uniform-cost search (UCS) variant[0].
  # Leverages Erlang's General balanced trees module for the priority queue
  #
  # [0] https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm#Practical_optimizations_and_infinite_graphs
  @spec lowest_risk(risk_matrix(), point()) :: risk()
  defp lowest_risk(risk_matrix, source \\ {0, 0}) do
    {target, _} = Enum.max_by(risk_matrix, fn {point, _} -> point end)
    do_lowest_risk({0, source}, :gb_sets.empty(), risk_matrix, target, MapSet.new())
  end

  @spec do_lowest_risk({risk(), point()}, :gb_sets.set(), risk_matrix(), point(), MapSet.t()) ::
          risk() | :disconnected
  defp do_lowest_risk({risk, target}, _queue, _risk_matrix, target, _seen), do: risk

  defp do_lowest_risk({risk, point}, queue, risk_matrix, target, seen) do
    seen = MapSet.put(seen, point)
    neighbors = MapSet.difference(neighbors(risk_matrix, point), seen)

    queue =
      Enum.reduce(neighbors, queue, fn point, queue ->
        :gb_sets.add({risk + risk_matrix[point], point}, queue)
      end)

    if :gb_sets.is_empty(queue) do
      :disconnected
    else
      {element, queue} = :gb_sets.take_smallest(queue)
      do_lowest_risk(element, queue, risk_matrix, target, seen)
    end
  end
end
