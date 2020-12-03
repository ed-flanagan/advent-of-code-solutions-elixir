defmodule Advent.Y2015.D05 do
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

  defp has_repeat_pairs(letters) do
    letters
    |> gen_pairs()
    |> dedup_overlaps()
    |> Enum.frequencies()
    |> Map.values()
    |> Enum.any?(&(&1 >= 2))
  end

  # gen_pairs
  defp gen_pairs(list), do: do_gen_pairs(list, [])

  defp do_gen_pairs([a, b | tail], pairs) do
    do_gen_pairs([b | tail], [{a, b} | pairs])
  end

  defp do_gen_pairs(_, pairs), do: pairs

  # dedup_overlaps
  defp dedup_overlaps(pairs), do: do_dedup_overlaps(pairs, [])
  defp do_dedup_overlaps([], new), do: new

  defp do_dedup_overlaps([a, a | tail], new) do
    do_dedup_overlaps(tail, [a | new])
  end

  defp do_dedup_overlaps([a | tail], new) do
    do_dedup_overlaps(tail, [a | new])
  end

  # has_sandwich
  defp has_sandwich([]), do: false
  defp has_sandwich([a, _b, a | _tail]), do: true
  defp has_sandwich([_head | tail]), do: has_sandwich(tail)
end
