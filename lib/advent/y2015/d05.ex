defmodule Advent.Y2015.D05 do
  @moduledoc """
  https://adventofcode.com/2015/day/5
  """

  @min_vowels 3
  @vowels ["a", "e", "i", "o", "u"]

  @spec part_one(words :: Enumerable.t()) :: integer()
  def part_one(words) do
    words
    |> Stream.map(&String.graphemes/1)
    |> Enum.count(fn letters ->
      has_vowels(letters) && has_pair(letters) && !has_bad_pair(letters)
    end)
  end

  defp has_vowels(letters) do
    Enum.count(letters, &(&1 in @vowels)) >= @min_vowels
  end

  defp has_pair([a, a | _tail]), do: true
  defp has_pair([_head | tail]), do: has_pair(tail)
  defp has_pair(_), do: false

  defp has_bad_pair(["a", "b" | _tail]), do: true
  defp has_bad_pair(["c", "d" | _tail]), do: true
  defp has_bad_pair(["p", "q" | _tail]), do: true
  defp has_bad_pair(["x", "y" | _tail]), do: true
  defp has_bad_pair([_a, b | tail]), do: has_bad_pair([b | tail])
  defp has_bad_pair(_), do: false

  def part_two(words) do
    words
    |> Stream.map(&String.graphemes/1)
    |> Enum.count(fn letters ->
      has_repeat_pairs(letters) && has_sandwich(letters)
    end)
  end

  # 1. Unfold the letters into overlapping pairs, e.g.
  #    "abcd" -> [{"a", "b"}, {"b", "c"}, {"c", "d}]
  # 2. Unfold overlapping duplicates, e.g.
  #    "aaa" -> [{"a", "a"}, {"a", "a"}] -> [{"a", "a"}]
  #    "aaaa" -> [{"a", "a"}, {"a", "a"}, {"a", "a"}] -> [{"a", "a"}, {"a", "a"}]
  #    * Both unfolds were originally functions, but wanted to try unfold
  #      also saved some lines
  # 3. Count the frequencies of all pairs
  #   * You could use Enum.reduce_while to halt once a pair is found. However,
  #     I felt the frequencies() + any?() combo was cleaner. I also imagine
  #     any short-circuit gains are negligible with small input
  # 4. Return if there are any frequencies >= 2
  defp has_repeat_pairs(letters) do
    letters
    |> Stream.unfold(fn
      [a, b | tail] -> {{a, b}, [b | tail]}
      _ -> nil
    end)
    |> Enum.to_list()
    |> Stream.unfold(fn
      [a, a | tail] -> {a, tail}
      [a | tail] -> {a, tail}
      _ -> nil
    end)
    |> Enum.frequencies()
    |> Map.values()
    |> Enum.any?(&(&1 >= 2))
  end

  # has_sandwich
  defp has_sandwich([a, _b, a | _tail]), do: true
  defp has_sandwich([_head | tail]), do: has_sandwich(tail)
  defp has_sandwich(_), do: false
end
