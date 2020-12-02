defmodule Advent.Y2020.D01 do
  @moduledoc """
  """

  @target 2020

  @doc """
  Expects file contents to be integer values seperated by a newline, e.g.

  1721
  979
  366
  """
  @spec stream_input_file!(filename :: Path.t()) :: Enumerable.t()
  def stream_input_file!(filename) do
    File.stream!(filename)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
  end

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
      try do
        for b <- acc,
            (@target - (a + b)) in acc do
          throw({:halt, b})
        end
      catch
        {:halt, b} ->
          {:halt, a * b * (@target - (a + b))}
      else
        _ ->
          {:cont, MapSet.put(acc, a)}
      end
    end)
  end
end
