defmodule Advent.Y2022.D02 do
  @moduledoc """
  https://adventofcode.com/2022/day/2
  """

  @doc """
  What would your total score be if everything goes exactly according to your
  strategy guide?
  """
  @spec part_one(Enumerable.t()) :: integer()
  def part_one(input) do
    input
    |> Stream.map(fn
      "A X" -> 1 + 3
      "A Y" -> 2 + 6
      "A Z" -> 3 + 0
      "B X" -> 1 + 0
      "B Y" -> 2 + 3
      "B Z" -> 3 + 6
      "C X" -> 1 + 6
      "C Y" -> 2 + 0
      "C Z" -> 3 + 3
    end)
    |> Enum.sum()
  end

  @doc """
  Following the Elf's instructions for the second column, what would your total
  score be if everything goes exactly according to your strategy guide?
  """
  @spec part_two(Enumerable.t()) :: integer()
  def part_two(input) do
    input
    |> Stream.map(fn
      "A X" -> 3 + 0
      "B X" -> 1 + 0
      "C X" -> 2 + 0
      "A Y" -> 1 + 3
      "B Y" -> 2 + 3
      "C Y" -> 3 + 3
      "A Z" -> 2 + 6
      "B Z" -> 3 + 6
      "C Z" -> 1 + 6
    end)
    |> Enum.sum()
  end
end
