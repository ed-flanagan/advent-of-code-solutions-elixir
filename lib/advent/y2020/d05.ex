defmodule Advent.Y2020.D05 do
  @moduledoc """
  https://adventofcode.com/2020/day/5
  """

  import Bitwise

  @doc """
  What is the highest seat ID on a boarding pass?
  """
  @spec part_one(passes :: Enumerable.t()) :: integer()
  def part_one(passes) do
    passes
    |> Stream.map(&seat_id/1)
    |> Enum.max()
  end

  @doc """
  What is the ID of your seat?
  """
  # NOTE: this strategy assumes there is exactly one missing id within a
  # contiguous set of ids
  @spec part_two(passes :: Enumerable.t()) :: integer() | nil
  def part_two(passes) do
    passes
    |> Stream.map(&seat_id/1)
    |> Enum.reduce({:infinity, -1, 0}, fn id, {min, max, sum} ->
      min = if id < min, do: id, else: min
      max = if id > max, do: id, else: max
      sum = bxor(sum, id)

      {min, max, sum}
    end)
    |> then(fn {min, max, sum} ->
      bxor(sum, Enum.reduce(min..max, 0, &bxor/2))
    end)

    # NOTE: this strategy will return the first empty seat and nil if none.
    # However, it requires sorting, so less efficient, but above requires an
    # assumption
    # |> Enum.sort()
    # |> find_middle_seat()
  end

  # F, B, R, L represent bits.
  # B = R = 1
  # F = L = 0
  # I'm not sure on what's the "best" approach, so I went with the Bitwise
  # version, which _felt_ fanciest. Constructing single bit bitstring might be
  # more efficient, but don't know
  defp seat_id(partition) do
    partition
    |> String.graphemes()
    |> Enum.reduce(0, fn c, sum ->
      sum <<< 1 ||| if c == "B" || c == "R", do: 1, else: 0
    end)
  end

  # Assumes the list is sorted
  # defp find_middle_seat([a, b | _tail]) when b - a == 2, do: a + 1
  # defp find_middle_seat([_a, b | tail]), do: find_middle_seat([b | tail])
  # defp find_middle_seat(_), do: nil
end
