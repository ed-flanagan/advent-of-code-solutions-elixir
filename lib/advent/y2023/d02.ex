defmodule Advent.Y2023.D02 do
  @moduledoc """
  https://adventofcode.com/2023/day/2
  """

  import NimbleParsec

  alias Advent.Y2023.D02

  spaces = ignore(repeat(string(" ")))

  game =
    ignore(string("Game"))
    |> concat(spaces)
    |> integer(min: 1)
    |> unwrap_and_tag(:game)
    |> ignore(string(":"))

  blocks =
    ["red", "blue", "green"]
    |> Enum.map(fn color ->
      integer(min: 1)
      |> concat(spaces)
      |> ignore(string(color))
      |> unwrap_and_tag(String.to_atom(color))
    end)

  pull =
    spaces
    |> choice(blocks)
    |> ignore(
      choice([
        string(","),
        string(";"),
        eos()
      ])
    )

  defparsec(:games_record, ignore(game) |> concat(repeat(pull)))

  @doc """
  Determine which games would have been possible if the bag had been loaded
  with only 12 red cubes, 13 green cubes, and 14 blue cubes. What is the sum of
  the IDs of those games?
  """
  @spec part_one(Enumerable.t()) :: pos_integer()
  def part_one(input) do
    limits = %{red: 12, green: 13, blue: 14}

    input
    |> parse_input()
    |> Stream.with_index(1)
    |> Stream.reject(fn {blocks, _idx} ->
      Enum.any?(blocks, fn {color, count} ->
        count > limits[color]
      end)
    end)
    |> Stream.map(fn {_blocks, idx} -> idx end)
    |> Enum.sum()
  end

  @doc """
  For each game, find the minimum set of cubes that must have been present.
  What is the sum of the power of these sets?
  """
  @spec part_two(Enumerable.t()) :: pos_integer()
  def part_two(input) do
    input
    |> parse_input()
    |> Stream.map(fn blocks ->
      [:red, :green, :blue]
      |> Enum.map(fn color ->
        blocks
        |> Keyword.get_values(color)
        |> Enum.max()
      end)
      |> Enum.product()
    end)
    |> Enum.sum()
  end

  # Could I have done this without NimbleParsec? Absolutely. However, I wanted
  # to try the library out.
  # Further, the parser is likely not idiomatic, since I'm not too familiar. It
  # also parses exactly what each game record is expected. You may be able to
  # modify to only match the num/blocks and just ignore rest. However, I don't
  # know if that offers any benefit other than code conciseness.
  #
  # Here's a regex that will more or less do the same thing (would need to
  # adapt to list position rather than labels)
  # Regex.scan(~r/(?:(?<red>\d+)\s+red)|(?:(?<green>\d+)\s+green)|(?:(?<blue>\d+)\s+blue)/, line, capture: :all_names)
  @spec parse_input(Enumerable.t()) :: Enumerable.t()
  defp parse_input(input) do
    input
    |> Stream.map(&String.trim/1)
    |> Stream.map(&D02.games_record/1)
    |> Stream.map(fn {:ok, blocks, "", %{}, _, _} -> blocks end)
  end
end
