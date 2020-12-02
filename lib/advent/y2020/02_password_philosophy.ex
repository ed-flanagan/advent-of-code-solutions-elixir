defmodule Advent.Y2020.D02 do
  # e.g., '2-10 b: abba
  @entry_match ~r/(?<min>\d+)\-(?<max>\d+) (?<char>[a-z]): (?<password>[a-z]+)/

  @spec part_one(entries :: Enumerable.t()) :: integer()
  def part_one(entries) do
    for entry <- entries,
        %{"min" => min_bin, "max" => max_bin, "char" => char_bin, "password" => password} =
          Regex.named_captures(@entry_match, entry),
        reduce: 0 do
      num_valid ->
        # Convert string matches to proper forms
        min = String.to_integer(min_bin)
        max = String.to_integer(max_bin)
        char = char_bin |> to_charlist |> List.first()

        # Resolve the frequency of the given character
        num_chars =
          password
          |> to_charlist
          |> Enum.frequencies()
          |> Map.get(char, 0)

        # if Enum.member?(min..max, num_chars) do
        if min <= num_chars && num_chars <= max do
          num_valid + 1
        else
          num_valid
        end
    end
  end

  def part_two(entries) do
    for entry <- entries,
        %{"min" => min_bin, "max" => max_bin, "char" => char_bin, "password" => password} =
          Regex.named_captures(@entry_match, entry),
        reduce: 0 do
      num_valid ->
        # Convert string matches to proper forms
        i = String.to_integer(min_bin)
        j = String.to_integer(max_bin)
        char = char_bin |> to_charlist |> List.first()
        pwd = password |> to_charlist

        # True if exactly one of the positions was the character
        # xor exclusive disjunction
        # https://en.wikipedia.org/wiki/Exclusive_or#Equivalences,_elimination,_and_introduction
        pwd_i = Enum.at(pwd, i - 1) == char
        pwd_j = Enum.at(pwd, j - 1) == char
        char_xor = (pwd_i && !pwd_j) || (!pwd_i && pwd_j)

        if char_xor do
          num_valid + 1
        else
          num_valid
        end
    end
  end
end
