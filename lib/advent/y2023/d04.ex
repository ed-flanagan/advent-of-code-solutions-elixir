defmodule Advent.Y2023.D04 do
  @moduledoc """
  https://adventofcode.com/2023/day/4
  """

  import NimbleParsec

  alias Advent.Y2023.D04

  spaces = ignore(repeat(string(" ")))
  number = spaces |> integer(min: 1)

  card =
    ignore(string("Card"))
    |> concat(spaces)
    |> integer(min: 1)
    |> unwrap_and_tag(:card)
    |> ignore(string(":"))

  winners =
    repeat(number)
    |> tag(:winners)
    |> concat(spaces)
    |> ignore(string("|"))

  yours =
    repeat(number)
    |> tag(:yours)
    |> concat(spaces)
    |> eos()

  defparsec(:scratchcard, card |> concat(winners) |> concat(yours))

  @doc """
  How many points are they worth in total?
  """
  @spec part_one(Enumerable.t()) :: pos_integer()
  def part_one(input) do
    input
    |> parse_input()
    |> Stream.map(fn {_card, intersection} ->
      intersection
      |> length()
      |> case do
        0 -> 0
        n -> 2 ** (n - 1)
      end
    end)
    |> Enum.sum()
  end

  @doc """
  Process all of the original and copied scratchcards until no more
  scratchcards are won. Including the original set of scratchcards, how many
  total scratchcards do you end up with?
  """
  @spec part_two(Enumerable.t()) :: any()
  def part_two(input) do
    gen =
      input
      |> parse_input()
      |> Map.new(fn {card, intersection} ->
        copies =
          intersection
          |> Enum.with_index(card + 1)
          |> Enum.map(&elem(&1, 1))

        {card, copies}
      end)

    Stream.unfold(Map.keys(gen), fn
      [] -> nil
      [card | rest] -> {card, gen[card] ++ rest}
    end)
    |> Enum.count()
  end

  @spec parse_input(Enumerable.t()) :: Enumerable.t()
  defp parse_input(input) do
    input
    |> Stream.map(&String.trim/1)
    |> Stream.map(&D04.scratchcard/1)
    |> Stream.map(fn {:ok, cards, "", %{}, _, _} -> cards end)
    |> Stream.map(fn card: card, winners: winners, yours: yours ->
      intersection =
        MapSet.intersection(MapSet.new(winners), MapSet.new(yours))
        |> MapSet.to_list()

      {card, intersection}
    end)
  end
end
