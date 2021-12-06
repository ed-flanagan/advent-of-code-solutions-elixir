defmodule Advent.Y2021.D06 do
  @moduledoc """
  https://adventofcode.com/2021/day/6
  """

  @doc """
  Find a way to simulate lanternfish. How many lanternfish would there be after
  80 days?
  """
  @spec part_one([integer()], integer()) :: integer()
  def part_one(seed, days) do
    map_solution(seed, days)
  end

  @doc """
  How many lanternfish would there be after 256 days?
  """
  # NOTE: I do _not_ recommend running this with `list_solution/2`
  @spec part_two([integer()], integer()) :: integer()
  def part_two(seed, days) do
    map_solution(seed, days)
  end

  @spec list_solution([integer()], integer()) :: integer()
  defp list_solution(seed, days) do
    Stream.iterate(seed, fn fish ->
      num_spawning_fish = Enum.count(fish, &(&1 == 0))

      fish =
        Enum.map(fish, fn
          0 -> 6
          n -> n - 1
        end)

      fish ++ List.duplicate(8, num_spawning_fish)
    end)
    |> Enum.at(days)
    |> length()
  end

  defp map_solution(seed, days) do
    fish = Enum.frequencies(seed)

    Stream.unfold({0, fish, %{}}, fn
      {day, fish, spawn} ->
        fish_cycle = rem(day, 7)
        spawn_cycle = rem(day, 9)

        num_new_fish = Map.get(spawn, spawn_cycle, 0)
        fish = Map.update(fish, fish_cycle, num_new_fish, &(&1 + num_new_fish))

        spawn = Map.put(spawn, spawn_cycle, Map.fetch!(fish, fish_cycle))

        {{fish, spawn}, {day + 1, fish, spawn}}
    end)
    |> Enum.at(days - 1)
    |> (fn {fish, spawn} ->
          Map.merge(fish, spawn, fn _k, v1, v2 -> v1 + v2 end)
        end).()
    |> Map.values()
    |> Enum.sum()
  end
end
