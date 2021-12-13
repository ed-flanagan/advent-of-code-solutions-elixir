defmodule Advent.Y2021.D13 do
  @moduledoc """
  https://adventofcode.com/2021/day/13
  """

  @typep fold :: {:x | :y, non_neg_integer()}

  @doc """
  How many dots are visible after completing just the first fold instruction on
  your transparent paper?
  """
  @spec part_one(Enumerable.t()) :: non_neg_integer()
  def part_one(input) do
    {paper, [instruction | _rest]} = parse_input(input)

    paper
    |> fold(instruction)
    |> MapSet.size()
  end

  @doc """
  What code do you use to activate the infrared thermal imaging camera system?
  """
  @spec part_two(Enumerable.t()) :: [String.t()]
  def part_two(input) do
    {paper, instructions} = parse_input(input)

    paper =
      Enum.reduce(instructions, paper, fn instruction, paper ->
        fold(paper, instruction)
      end)

    {{x_min, _}, {x_max, _}} = Enum.min_max_by(paper, &elem(&1, 0))
    {{_, y_min}, {_, y_max}} = Enum.min_max_by(paper, &elem(&1, 1))

    for y <- y_min..y_max do
      for x <- x_min..x_max, into: "" do
        if MapSet.member?(paper, {x, y}), do: "#", else: "."
      end
    end
  end

  @spec print_part_two([String.t()]) :: :ok
  def print_part_two(feed) do
    feed
    |> Enum.map(fn line ->
      line
      |> String.graphemes()
      |> Enum.map(fn
        "#" -> IO.ANSI.format([:green_background, :green, "#"])
        "." -> IO.ANSI.format([:black_background, :black, "."])
      end)
      |> Enum.join()
    end)
    |> Enum.each(&IO.puts/1)
  end

  @spec parse_input(Enumerable.t()) :: {MapSet.t(), [fold()]}
  defp parse_input(input) do
    Enum.reduce(input, {MapSet.new(), []}, fn
      <<"fold along ", axis, "=", cut::binary>>, {paper, instructions} ->
        {paper, instructions ++ [{List.to_atom([axis]), String.to_integer(cut)}]}

      "", {paper, instructions} ->
        {paper, instructions}

      line, {paper, instructions} ->
        [x, y] = line |> String.split(",") |> Enum.map(&String.to_integer/1)
        {MapSet.put(paper, {x, y}), instructions}
    end)
  end

  @spec fold(MapSet.t(), fold()) :: MapSet.t()
  # NOTE: would like to find a way to consolidate the `fold/2` functions, but
  #       haven't found a way I like...
  defp fold(paper, {:x, cut}) do
    {a, b} = Enum.split_with(paper, fn {x, _y} -> x < cut end)

    b =
      b
      |> Enum.reject(fn {x, _y} -> x == cut end)
      |> Enum.map(fn {x, y} -> {transform(x, cut), y} end)
      |> MapSet.new()

    MapSet.union(MapSet.new(a), b)
  end

  defp fold(paper, {:y, cut}) do
    {a, b} = Enum.split_with(paper, fn {_x, y} -> y < cut end)

    b =
      b
      |> Enum.reject(fn {_x, y} -> y == cut end)
      |> Enum.map(fn {x, y} -> {x, transform(y, cut)} end)
      |> MapSet.new()

    MapSet.union(MapSet.new(a), b)
  end

  @spec transform(integer(), integer()) :: integer()
  defp transform(n, cut), do: n - 2 * (n - cut)
end
