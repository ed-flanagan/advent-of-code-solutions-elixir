defmodule Advent.Y2020.D15 do
  @moduledoc """
  https://adventofcode.com/2020/day/15
  """

  def part_one(input) do
    do_challenge(input, 2020)
  end

  def part_two(input) do
    do_challenge(input, 30_000_000)
  end

  defp do_challenge(seed, turns) do
    [next | earlier] =
      seed
      |> Enum.with_index(1)
      |> Enum.reverse()

    Stream.unfold({next, Map.new(earlier)}, fn {{last, turn}, spoken} ->
      {speak, spoken} =
        Map.get_and_update(spoken, last, fn
          nil -> {0, turn}
          t0 -> {turn - t0, turn}
        end)

      next = {speak, turn + 1}
      {next, {next, spoken}}
    end)
    |> Enum.reduce_while(nil, fn
      {n, ^turns}, _ -> {:halt, n}
      _, _ -> {:cont, nil}
    end)
  end
end
