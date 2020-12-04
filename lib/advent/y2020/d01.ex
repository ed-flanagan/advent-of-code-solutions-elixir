defmodule Advent.Y2020.D01 do
  @target 2020

  # 2SUM
  @spec part_one(values :: Enumerable.t()) :: integer()
  def part_one(values) do
    Enum.reduce_while(values, MapSet.new(), fn a, acc ->
      if MapSet.member?(acc, @target - a) do
        {:halt, a * (@target - a)}
      else
        {:cont, MapSet.put(acc, a)}
      end
    end)
  end

  # 3SUM
  # NOTE: this approach doesn't prevent finding the same value again, i.e.
  # a + 2b is a possible.
  @spec part_two(values :: Enumerable.t()) :: integer()
  def part_two(values) do
    Enum.reduce_while(values, MapSet.new(), fn a, acc ->
      Enum.find(acc, &MapSet.member?(acc, @target - (a + &1)))
      |> case do
        nil -> {:cont, MapSet.put(acc, a)}
        b -> {:halt, a * b * (@target - (a + b))}
      end
    end)
  end
end
