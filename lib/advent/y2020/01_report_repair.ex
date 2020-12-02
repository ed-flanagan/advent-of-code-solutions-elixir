defmodule Advent.Y2020.D01 do
  @moduledoc """
  """

  @target 2020

  @doc """
  2SUM
  """
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

  @doc """
  3SUM
  """
  @spec part_two(values :: Enumerable.t()) :: integer()
  def part_two(values) do
    Enum.reduce_while(values, MapSet.new(), fn a, acc ->
      Enum.find(acc, fn b ->
        # NOTE: this doesn't prevent finding b (i.e implies a + 2b is possible)
        MapSet.member?(acc, @target - (a + b))
      end)
      |> case do
        nil -> {:cont, MapSet.put(acc, a)}
        b -> {:halt, a * b * (@target - (a + b))}
      end

      # Old way with try/catch
      # try do
      #   for b <- acc,
      #       (@target - (a + b)) in acc do
      #     throw({:halt, b})
      #   end
      # catch
      #   {:halt, b} ->
      #     {:halt, a * b * (@target - (a + b))}
      # else
      #   _ ->
      #     {:cont, MapSet.put(acc, a)}
      # end
    end)
  end
end
