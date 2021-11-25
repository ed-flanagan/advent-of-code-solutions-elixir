defmodule Advent.Y2020.D06 do
  @moduledoc """
  https://adventofcode.com/2020/day/6
  """

  def part_one(answers) do
    reduce_groups(answers, MapSet.new(), &MapSet.union/2)
  end

  def part_two(answers) do
    reduce_groups(answers, MapSet.new(?a..?z), &MapSet.intersection/2)
  end

  defp reduce_groups(answers, init, agg) do
    answers
    |> Stream.chunk_while(
      init,
      fn
        "", acc -> {:cont, acc, init}
        a, acc -> {:cont, a |> String.to_charlist() |> MapSet.new() |> agg.(acc)}
      end,
      &{:cont, &1, init}
    )
    |> Stream.map(&MapSet.size/1)
    |> Enum.sum()
  end
end
