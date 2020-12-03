defmodule Advent.Y2020.D02 do
  # e.g., '2-10 b: abba'
  @entry_match ~r/(?<min>\d+)\-(?<max>\d+) (?<char>[a-z]): (?<password>[a-z]+)/

  @spec part_one(entries :: Enumerable.t()) :: integer()
  def part_one(entries) do
    map_entries(entries)
    |> Enum.count(fn {min, max, char, chars} ->
      char_occur = Enum.count(chars, &(&1 == char))

      min <= char_occur && char_occur <= max
    end)
  end

  def part_two(entries) do
    map_entries(entries)
    |> Enum.count(fn {min, max, char, chars} ->
      char_at_min = char == Enum.at(chars, min - 1)
      char_at_max = char == Enum.at(chars, max - 1)

      # True if exactly one of the positions was the character
      # xor exclusive disjunction
      (char_at_min && !char_at_max) || (!char_at_min && char_at_max)
    end)
  end

  # Extract and "cast" the captures from the regex
  defp map_entries(entries) do
    Stream.map(entries, fn entry ->
      %{"min" => min, "max" => max, "char" => char, "password" => password} =
        Regex.named_captures(@entry_match, entry)

      {String.to_integer(min), String.to_integer(max), char, String.graphemes(password)}
    end)
  end
end
