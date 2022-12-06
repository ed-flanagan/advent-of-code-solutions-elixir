defmodule Advent.Y2022.D06 do
  @moduledoc """
  https://adventofcode.com/2022/day/6
  """

  @doc """
  How many characters need to be processed before the first start-of-packet
  marker is detected?
  """
  @spec part_one(Enumerable.t()) :: pos_integer()
  def part_one(input), do: solution(input, 4)

  @doc """
  How many characters need to be processed before the first start-of-message
  marker is detected?
  """
  @spec part_two(Enumerable.t()) :: pos_integer()
  def part_two(input), do: solution(input, 14)

  @spec solution(Enumerable.t(), pos_integer()) :: pos_integer()
  defp solution(input, seq_len) do
    input
    |> Stream.flat_map(&String.to_charlist/1)
    |> Stream.chunk_every(seq_len, 1, :discard)
    |> Enum.find_index(&(length(Enum.uniq(&1)) == seq_len))
    |> Kernel.+(seq_len)
  end
end
