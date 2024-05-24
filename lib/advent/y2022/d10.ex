defmodule Advent.Y2022.D10 do
  @moduledoc """
  https://adventofcode.com/2022/day/10
  """

  @doc """
  Find the signal strength during the 20th, 60th, 100th, 140th, 180th, and
  220th cycles. What is the sum of these six signal strengths?
  """
  @spec part_one(Enumerable.t()) :: integer()
  def part_one(input) do
    input
    |> parse_input()
    |> Stream.with_index(1)
    |> Stream.filter(fn {_x, cycle} -> cycle in 20..220//40 end)
    |> Stream.map(fn {x, cycle} -> cycle * x end)
    |> Enum.sum()
  end

  @doc """
  Render the image given by your program. What eight capital letters appear on
  your CRT?
  """
  @spec part_two(Enumerable.t()) :: [String.t()]
  def part_two(input) do
    input
    |> parse_input()
    |> Enum.chunk_every(40)
    |> Enum.map(fn row ->
      row
      |> Enum.with_index()
      |> Enum.into("", fn
        {sprite, idx} when idx in (sprite - 1)..(sprite + 1) -> "#"
        _ -> "."
      end)
    end)
  end

  @spec print_part_two([String.t()], boolean()) :: :ok
  def print_part_two(feed, emit? \\ IO.ANSI.enabled?()) do
    feed
    |> Enum.map(fn line ->
      line
      |> String.graphemes()
      |> Enum.map_join(fn
        "#" -> IO.ANSI.format([:green_background, :green, "#"], emit?)
        "." -> IO.ANSI.format([:black_background, :black, "."], emit?)
      end)
    end)
    |> Enum.each(&IO.puts/1)
  end

  @spec parse_input(Enumerable.t()) :: Enumerable.t()
  defp parse_input(input) do
    Stream.transform(input, 1, fn
      "noop", x -> {[x], x}
      "addx " <> d, x -> {[x, x], x + String.to_integer(d)}
    end)
  end
end
