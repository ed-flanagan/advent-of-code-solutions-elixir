defmodule Advent.Y2021.D12 do
  @moduledoc """
  https://adventofcode.com/2021/day/12
  """

  @typep cave :: String.t()
  @typep cave_system :: %{cave() => MapSet.t()}

  @doc """
  How many paths through this cave system are there that visit small caves at
  most once?
  """
  @spec part_one(Enumerable.t()) :: non_neg_integer()
  def part_one(input) do
    input
    |> parse_input()
    |> count_exits(1)
  end

  @doc """
  Given these new rules, how many paths through this cave system are there?
  """
  @spec part_two(Enumerable.t()) :: non_neg_integer()
  def part_two(input) do
    input
    |> parse_input()
    |> count_exits(2)
  end

  @spec parse_input(Enumerable.t()) :: cave_system()
  defp parse_input(input) do
    input
    |> Stream.map(&Regex.run(~r/(\w+)\-(\w+)/, &1, capture: :all_but_first))
    |> Stream.flat_map(fn [a, b] -> [{a, b}, {b, a}] end)
    |> Enum.reduce(%{}, fn
      {_a, "start"}, cave_system -> cave_system
      {"end", _b}, cave_system -> cave_system
      {a, b}, cave_system -> Map.update(cave_system, a, MapSet.new([b]), &MapSet.put(&1, b))
    end)
  end

  @spec count_exits(cave_system(), pos_integer()) :: non_neg_integer()
  defp count_exits(cave_system, max_v) do
    do_count_exits(cave_system, "start", Map.new(), max_v, 0)
  end

  @spec do_count_exits(cave_system(), cave(), map(), pos_integer(), non_neg_integer()) ::
          non_neg_integer()
  defp do_count_exits(_cave_system, "end", _seen, _max_v, count), do: count + 1

  defp do_count_exits(cave_system, cave, seen, max_v, count) do
    seen =
      if is_small_cave(cave),
        do: Map.update(seen, cave, 1, &(&1 + 1)),
        else: seen

    sub =
      if Enum.any?(Map.values(seen), &(&1 == max_v)),
        do: seen |> Map.keys() |> MapSet.new(),
        else: MapSet.new()

    todo = MapSet.difference(cave_system[cave], sub)

    Enum.map(todo, fn c ->
      do_count_exits(cave_system, c, seen, max_v, count)
    end)
    |> Enum.sum()
  end

  @spec is_small_cave(cave()) :: boolean()
  defp is_small_cave(cave) do
    String.downcase(cave) == cave
  end
end
