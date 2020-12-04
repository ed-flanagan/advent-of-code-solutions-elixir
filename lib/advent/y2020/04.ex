# So... I honestly don't know if this is overcomplicated or not. It might just
# because there are so many things to check? In any case, pattern matching is
# cool, no regex needed, but feels very... blocky? 

defmodule Advent.Y2020.D04 do
  @valid_ecls ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]

  def(part_one(entries)) do
    entries
    |> stream_passports()
    |> Enum.count(fn
      %{byr: _, iyr: _, eyr: _, hgt: _, hcl: _, ecl: _, pid: _} ->
        true

      _ ->
        false
    end)
  end

  def part_two(entries) do
    entries
    |> stream_passports()
    |> Enum.count(fn
      %{
        byr: <<byr::binary-size(4)>>,
        iyr: <<iyr::binary-size(4)>>,
        eyr: <<eyr::binary-size(4)>>,
        hgt: hgt,
        hcl: <<"#", hcl::binary-size(6)>>,
        ecl: ecl,
        pid: <<pid::binary-size(9)>>
      } ->
        with {:ok, _} <- hcl |> String.upcase(:ascii) |> Base.decode16(),
             {_pid, ""} <- pid |> Integer.parse() do
          inbetween(byr, 1920..2002) &&
            inbetween(iyr, 2010..2020) &&
            inbetween(eyr, 2020..2030) &&
            valid_hgt(hgt) &&
            ecl in @valid_ecls
        else
          _ -> false
        end

      _ ->
        false
    end)
  end

  defp valid_hgt(<<hgt::binary-size(3), "cm">>), do: inbetween(hgt, 150..193)
  defp valid_hgt(<<hgt::binary-size(2), "in">>), do: inbetween(hgt, 59..76)
  defp valid_hgt(_), do: false

  defp inbetween(val, min..max) when is_integer(val) and val in min..max, do: true

  defp inbetween(val, min..max) when is_bitstring(val) do
    case Integer.parse(val) do
      {val, ""} -> inbetween(val, min..max)
      _ -> false
    end
  end

  defp inbetween(_, _), do: false

  # 1. Chunk lines until there's an empty line
  # 2. Join lines together
  # 3. Split string by " " and ":", which should result in alternating key/values
  # 4. Chunk every 2, pairing elements together
  # 5. Create a map from the paired elements
  defp stream_passports(entries) do
    entries
    |> Stream.chunk_while(
      [],
      fn
        # NOTE: we don't _need_ to reverse, but it's in the spirit of order
        "", passport -> {:cont, Enum.reverse(passport), []}
        line, passport -> {:cont, [line | passport]}
      end,
      fn
        [] -> {:cont, []}
        passport -> {:cont, Enum.reverse(passport), []}
      end
    )
    |> Stream.map(&Enum.join(&1, " "))
    |> Stream.map(&String.split(&1, [" ", ":"], trim: true))
    |> Stream.map(&Enum.chunk_every(&1, 2))
    |> Stream.map(&Map.new(&1, fn [k, v] -> {String.to_atom(k), v} end))
  end
end
