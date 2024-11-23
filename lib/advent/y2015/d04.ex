defmodule Advent.Y2015.D04 do
  @moduledoc """
  https://adventofcode.com/2015/day/4
  """

  def part_one(key, limit) do
    brute_search_md5_pad(0..limit, key, "00000")
  end

  def part_two(key, limit) do
    brute_search_md5_pad(0..limit, key, "000000")
  end

  # NOTE: I originally implimented using multiple function heads, e.g.
  # `brute_search("00000" <> _rest, ...)`
  # However, it wasn't portable with the different searches
  # String.starts_with? does a binary prefix check, so should still be fast
  # I also wanted to force the use of a hard ceiling to help limit run-away
  # searches
  defp brute_search_md5_pad(start..stop//_, key, hash_pad) do
    start..stop
    |> Stream.map(&Integer.to_string/1)
    |> Enum.find(fn i ->
      :crypto.hash(:md5, key <> i)
      |> Base.encode16()
      |> String.starts_with?(hash_pad)
    end)
    |> case do
      nil -> :error
      i -> String.to_integer(i)
    end
  end
end
