defmodule Advent.Y2023.D05 do
  @moduledoc """
  https://adventofcode.com/2023/day/5
  """

  alias Advent.Y2023.D05.Parser

  @doc """
  What is the lowest location number that corresponds to any of the initial
  seed numbers?
  """
  @spec part_one(String.t()) :: pos_integer()
  def part_one(input) do
    {seeds, map} = parse_input(input)

    seeds
    |> Enum.map(&fold(&1, map))
    |> Enum.min()
  end

  @doc """
  What is the lowest location number that corresponds to any of the initial
  seed numbers?
  """
  @spec part_two(String.t()) :: pos_integer()
  def part_two(input) do
    {seeds, map} = parse_input(input)

    seeds
    |> Stream.chunk_every(2)
    |> Stream.map(fn [start, num] -> start..(start + num - 1) end)
    |> Stream.flat_map(&Enum.to_list/1)
    |> Stream.map(&fold(&1, map))
    |> Enum.min()
  end

  @spec parse_input(String.t()) :: {list(), map()}
  defp parse_input(input) do
    {:ok, [seeds, map], "", %{}, _, _} = Parser.almanac(input)
    {seeds, map}
  end

  @spec fold(pos_integer(), map()) :: pos_integer()
  defp fold(seed, map), do: fold(map["seed"], seed, map)

  @spec fold({String.t(), []} | nil, pos_integer(), map()) :: pos_integer()
  defp fold(nil, num, _map), do: num

  defp fold({dst, ranges}, num, map) do
    {_range, delta} =
      Enum.find(ranges, {0..0, 0}, fn {range, _delta} ->
        num in range
      end)

    fold(map[dst], num - delta, map)
  end
end

defmodule Advent.Y2023.D05.Parser do
  import NimbleParsec

  whitespace = ignore(repeat(ascii_char([?\s, ?\n])))
  number = whitespace |> integer(min: 1)
  name = ascii_string([?a..?z], min: 1)

  seeds =
    ignore(string("seeds:"))
    |> concat(whitespace)
    |> repeat(number)
    # |> tag(:seeds)
    |> wrap()

  source = name |> unwrap_and_tag(:source)
  destination = name |> unwrap_and_tag(:destination)
  range = times(concat(whitespace, number), 3) |> wrap()
  ranges = repeat(range) |> tag(:ranges)

  map =
    whitespace
    |> concat(source)
    |> ignore(string("-to-"))
    |> concat(destination)
    |> concat(whitespace)
    |> ignore(string("map:"))
    |> concat(ranges)
    |> wrap()

  maps =
    repeat(map)
    |> wrap()
    # |> tag(:maps)
    |> map({:parsec_maps, []})

  defparsec(:almanac, seeds |> concat(maps) |> concat(whitespace))

  @spec parsec_maps([]) :: map()
  defp parsec_maps(maps) do
    Map.new(maps, fn source: src, destination: dst, ranges: rng ->
      proper_rng =
        Enum.map(rng, fn [d, s, r] ->
          {s..(s + r - 1), s - d}
        end)

      {src, {dst, proper_rng}}
    end)
  end
end
