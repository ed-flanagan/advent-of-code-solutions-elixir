defmodule Advent.Y2020.D01 do
  @moduledoc """
  https://adventofcode.com/2020/day/1
  """

  @target 2020

  @doc """
  Find the two entries that sum to 2020; what do you get if you multiply them
  together?
  """
  @spec part_one(Enumerable.t()) :: integer()
  def part_one(input) do
    {a, b} =
      input
      |> parse_input()
      |> Enum.to_list()
      |> two_sum(@target)

    a * b
  end

  @doc """
  What is the product of the three entries that sum to 2020?
  """
  @spec part_two(Enumerable.t()) :: integer()
  def part_two(input) do
    {a, b, c} =
      input
      |> parse_input()
      |> Enum.to_list()
      |> three_sum(@target)

    a * b * c
  end

  @spec two_sum([integer()], integer()) :: {integer(), integer()} | nil
  defp two_sum(values, target) do
    do_two_sum(values, target, MapSet.new())
  end

  @spec do_two_sum([integer()], integer(), MapSet.t()) :: {integer(), integer()} | nil
  defp do_two_sum([], _target, _seen), do: nil

  defp do_two_sum([b | rest], target, seen) do
    a = target - b

    if a in seen do
      {a, b}
    else
      do_two_sum(rest, target, MapSet.put(seen, b))
    end
  end

  @spec three_sum([integer()], integer()) :: {integer(), integer(), integer()} | nil
  def three_sum(values, target) do
    do_three_sum(values, target, MapSet.new())
  end

  @spec do_three_sum([integer()], integer(), MapSet.t()) ::
          {integer(), integer(), integer()} | nil
  defp do_three_sum([], _taget, _seen), do: nil

  defp do_three_sum(values, target, seen) do
    [b | rest] = values
    t = target - b

    case do_two_sum(rest, t, seen) do
      {a, c} -> {a, b, c}
      _ -> do_three_sum(rest, target, MapSet.put(seen, b))
    end
  end

  defp parse_input(input), do: Stream.map(input, &String.to_integer/1)
end
