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
        with {byr, ""} <- Integer.parse(byr),
             true <- 1920 <= byr && byr <= 2002,
             {iyr, ""} <- Integer.parse(iyr),
             true <- 2010 <= iyr && iyr <= 2020,
             {eyr, ""} <- Integer.parse(eyr),
             true <- 2020 <= eyr && eyr <= 2030,
             true <- valid_hgt(hgt),
             {:ok, _} <- hcl |> String.upcase(:ascii) |> Base.decode16(),
             true <- ecl in @valid_ecls,
             {_pid, ""} <- Integer.parse(pid) do
          true
        else
          _ -> false
        end

      _ ->
        false
    end)
  end

  defp valid_hgt(hgt) do
    case hgt do
      <<hgt::binary-size(3), "cm">> ->
        with {hgt, ""} <- Integer.parse(hgt),
             true <- 150 <= hgt && hgt <= 193 do
          true
        else
          _ -> false
        end

      <<hgt::binary-size(2), "in">> ->
        with {hgt, ""} <- Integer.parse(hgt),
             true <- 59 <= hgt && hgt <= 76 do
          true
        else
          _ -> false
        end

      _ ->
        false
    end
  end

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
