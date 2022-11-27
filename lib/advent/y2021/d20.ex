defmodule Advent.Y2021.D20 do
  @moduledoc """
  https://adventofcode.com/2021/day/20
  """

  import Bitwise

  @typep point :: {integer(), integer()}
  @typep pixel :: 0 | 1
  @typep image :: %{point() => pixel()}
  @typep lookup :: 0..511
  @typep algorithm_int :: non_neg_integer()
  @typep algorithm_map :: %{lookup() => pixel()}
  @typep algorithm :: algorithm_int() | algorithm_map()

  @doc """
  """
  @spec part_one(Enumerable.t()) :: non_neg_integer()
  def part_one(input) do
    {image, alg} = parse_input(input)

    solve(image, alg, 2)
  end

  @doc """
  """
  @spec part_two(Enumerable.t()) :: non_neg_integer()
  def part_two(input) do
    {image, alg} = parse_input(input)

    solve(image, alg, 50)
  end

  defp solve(image, alg, count) do
    Stream.iterate({image, 0}, &enhance(&1, alg))
    |> Enum.at(count)
    |> elem(0)
    |> Map.values()
    |> Enum.sum()
  end

  @spec parse_input(Enumerable.t()) :: {image(), algorithm()}
  defp parse_input(input) do
    {alg, image, _rows} =
      Enum.reduce(input, {[], nil, 0}, fn
        "", {alg, nil, 0} ->
          # int-based alg
          alg =
            alg
            |> Enum.reverse()
            |> Integer.undigits(2)

          # map-based alg
          # alg =
          #   alg
          #   |> Enum.reverse()
          #   |> Enum.with_index()
          #   |> Map.new(fn {bit, idx} -> {idx, bit} end)

          {alg, Map.new(), 0}

        line, {alg, nil, 0} ->
          alg =
            line
            |> String.graphemes()
            |> Enum.reduce(alg, fn
              ".", alg -> [0 | alg]
              "#", alg -> [1 | alg]
            end)

          {alg, nil, 0}

        line, {alg, image, row} ->
          image =
            line
            |> String.graphemes()
            |> Enum.with_index()
            |> Enum.reduce(image, fn
              {"#", col}, image -> Map.put(image, {col, row}, 1)
              {".", col}, image -> Map.put(image, {col, row}, 0)
            end)

          {alg, image, row + 1}
      end)

    {image, alg}
  end

  @spec neighbors(point()) :: [point()]
  defp neighbors({x, y}) do
    for y_inc <- -1..1,
        x_inc <- -1..1,
        do: {x + x_inc, y + y_inc}
  end

  @spec points_to_num([point()], image(), pixel()) :: integer()
  defp points_to_num(points, image, default) do
    points
    |> Enum.map(&Map.get(image, &1, default))
    |> Integer.undigits(2)
  end

  @spec lookup(lookup(), algorithm_int()) :: pixel()
  defp lookup(index, alg) when is_integer(alg) do
    alg >>> (511 - index) &&& 1
  end

  @spec lookup(lookup(), algorithm_map()) :: pixel()
  defp lookup(index, alg) when is_map(alg) do
    Map.fetch!(alg, index)
  end

  defp pixel(point, image, alg, default) do
    point
    |> neighbors()
    |> points_to_num(image, default)
    |> lookup(alg)
  end

  @spec enhance({image(), pixel()}, algorithm()) :: {image(), pixel()}
  defp enhance({image, default}, alg) do
    image =
      image
      |> Map.keys()
      |> Stream.flat_map(&neighbors/1)
      |> Stream.uniq()
      |> Map.new(fn point ->
        {point, pixel(point, image, alg, default)}
      end)

    default = lookup(default, alg)

    {image, default}
  end

  # defp print_image({image, _default}) do
  #   {{x_min, _}, {x_max, _}} = Enum.min_max_by(image, &elem(&1, 0))
  #   {{_, y_min}, {_, y_max}} = Enum.min_max_by(image, &elem(&1, 1))

  #   IO.puts("")

  #   for y <- y_min..y_max do
  #     for x <- x_min..x_max, into: "" do
  #       if MapSet.member?(image, {x, y}), do: "#", else: "."
  #     end
  #   end
  #   |> Enum.join("\n")
  #   |> IO.puts()
  # end
end
