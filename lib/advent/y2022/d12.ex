defmodule Advent.Y2022.D12 do
  @moduledoc """
  https://adventofcode.com/2022/day/12
  """

  @doc """
  What is the fewest steps required to move from your current position to the
  location that should get the best signal?
  """
  @spec part_one(Enumerable.t()) :: pos_integer()
  def part_one(input) do
    {graph, start, _lo, finish} = parse_input(input)

    length(:digraph.get_short_path(graph, start, finish)) - 1
  end

  @doc """
  What is the fewest steps required to move starting from any square with
  elevation a to the location that should get the best signal?
  """
  @spec part_two(Enumerable.t()) :: pos_integer()
  def part_two(input) do
    {graph, _start, lo, finish} = parse_input(input)

    lo
    |> Enum.map(fn start ->
      case :digraph.get_short_path(graph, start, finish) do
        false -> nil
        path -> length(path) - 1
      end
    end)
    |> Enum.min()
  end

  defp parse_input(input) do
    {grid, start, finish, lo} =
      input
      |> Stream.map(&String.to_charlist/1)
      |> Stream.with_index()
      |> Stream.flat_map(fn {row, y} ->
        row
        |> Enum.with_index()
        |> Enum.map(fn {height, x} -> {{x, y}, height} end)
      end)
      |> Enum.reduce({%{}, nil, nil, []}, fn
        {c, ?S}, {g, _, f, lo} -> {Map.put(g, c, ?a), c, f, [c | lo]}
        {c, ?E}, {g, s, _, lo} -> {Map.put(g, c, ?z), s, c, lo}
        {c, ?a}, {g, s, f, lo} -> {Map.put(g, c, ?a), s, f, [c | lo]}
        {c, ht}, {g, s, f, lo} -> {Map.put(g, c, ht), s, f, lo}
      end)

    graph = :digraph.new()

    grid
    |> Map.keys()
    |> Enum.each(&:digraph.add_vertex(graph, &1))

    Enum.each(grid, fn {coord = {x, y}, height} ->
      [{x - 1, y}, {x + 1, y}, {x, y + 1}, {x, y - 1}]
      |> Enum.filter(&(height + 1 >= Map.get(grid, &1)))
      |> Enum.each(&:digraph.add_edge(graph, coord, &1))
    end)

    {graph, start, lo, finish}
  end
end
