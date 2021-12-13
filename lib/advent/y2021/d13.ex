defmodule Advent.Y2021.D13 do
  @moduledoc """
  https://adventofcode.com/2021/day/13
  """

  @typep paper :: MapSet.t()

  @typep fold :: {:x | :y, non_neg_integer()}

  @doc """
  How many dots are visible after completing just the first fold instruction on
  your transparent paper?
  """
  @spec part_one(Enumerable.t()) :: non_neg_integer()
  def part_one(input) do
    {paper, [instruction | _rest]} = parse_input(input)

    fold(paper, instruction)
    |> MapSet.size()
  end

  @doc """
  What code do you use to activate the infrared thermal imaging camera system?
  """
  @spec part_two(Enumerable.t()) :: any()
  def part_two(input) do
    {paper, instructions} = parse_input(input)

    final =
      Enum.reduce(instructions, paper, fn instruction, paper ->
        fold(paper, instruction)
      end)

    {x_min, x_max} = final |> Enum.map(&elem(&1, 0)) |> Enum.min_max()
    {y_min, y_max} = final |> Enum.map(&elem(&1, 1)) |> Enum.min_max()

    for y <- y_min..y_max do
      for x <- x_min..x_max, into: "" do
        if MapSet.member?(final, {x, y}), do: "#", else: "."
      end
    end
  end

  @spec parse_input(Enumerable.t()) :: {paper(), [fold()]}
  defp parse_input(input) do
    input
    |> Enum.reduce({MapSet.new(), nil}, fn
      "", {paper, _} ->
        {paper, []}

      line, {paper, nil} ->
        [x, y] =
          Regex.run(~r/(\d+),(\d+)/, line, capture: :all_but_first)
          |> Enum.map(&String.to_integer/1)

        {MapSet.put(paper, {x, y}), nil}

      line, {paper, ins} ->
        [axis, val] = Regex.run(~r/([x|y])=(\d+)/, line, capture: :all_but_first)
        axis = if axis == "x", do: :x, else: :y
        val = String.to_integer(val)
        {paper, ins ++ [{axis, val}]}
    end)
  end

  @spec fold(paper(), fold()) :: paper()
  defp fold(paper, {:x, cut}) do
    a = paper |> Enum.filter(fn {x, _y} -> x < cut end) |> MapSet.new()

    b =
      paper
      |> Enum.filter(fn {x, _y} -> x > cut end)
      |> Enum.map(fn {x, y} ->
        {transform(x, cut), y}
      end)
      |> MapSet.new()

    MapSet.union(a, b)
  end

  defp fold(paper, {:y, cut}) do
    a = paper |> Enum.filter(fn {_x, y} -> y < cut end) |> MapSet.new()

    b =
      paper
      |> Enum.filter(fn {_x, y} -> y > cut end)
      |> Enum.map(fn {x, y} ->
        {x, transform(y, cut)}
      end)
      |> MapSet.new()

    MapSet.union(a, b)
  end

  @spec transform(integer(), integer()) :: integer()
  defp transform(n, cut), do: n - 2 * (n - cut)
end
