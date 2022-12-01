defmodule Advent.Y2022.D01 do
  @moduledoc """
  https://adventofcode.com/2022/day/1
  """

  @doc """
  Find the Elf carrying the most Calories. How many total Calories is that Elf
  carrying?
  """
  @spec part_one(Enum.t()) :: integer()
  def part_one(input) do
    input
    |> parse_input()
    |> Enum.max()
  end

  @doc """
  Find the top three Elves carrying the most Calories. How many Calories are
  those Elves carrying in total?
  """
  @spec part_two(Enum.t()) :: integer()
  def part_two(input) do
    input
    |> parse_input()
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
  end

  @spec parse_input(Enum.t()) :: Enum.t()
  defp parse_input(input) do
    Stream.chunk_while(
      input,
      0,
      fn
        "", acc -> {:cont, acc, 0}
        calories, acc -> {:cont, String.to_integer(calories) + acc}
      end,
      &{:cont, &1, 0}
    )
  end
end
