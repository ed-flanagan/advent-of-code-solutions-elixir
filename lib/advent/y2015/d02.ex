defmodule Advent.Y2015.D02 do
  @doc """
  * Map the dimensions into the total area needed.
    The slack area is computed using the smallest two surfaces. We rely on
    each dimension list to be sorted
  * Sum the dimensions
  """
  @spec part_one(dimensions :: Enumerable.t()) :: integer()
  def part_one(dimensions) do
    stream_dimensions(dimensions)
    |> Stream.map(fn [x, y, z] ->
      surface_area = 2 * (x * y + x * z + y * z)
      slack_area = x * y
      surface_area + slack_area
    end)
    |> Enum.sum()
  end

  @doc """
  * Map each dimension set into the minimum ribbon length. We rely on the
    sorted values again
  * Sum ribbon lengths
  """
  @spec part_two(dimensions :: Enumerable.t()) :: integer()
  def part_two(dimensions) do
    stream_dimensions(dimensions)
    |> Stream.map(fn [x, y, z] ->
      wrap = 2 * (x + y)
      bow = x * y * z
      wrap + bow
    end)
    |> Enum.sum()
  end

  # This creates a stream that will map each string dimension into a
  # sorted list
  @spec stream_dimensions(dimensions :: Enumerable.t()) :: Enumerable.t()
  defp stream_dimensions(dimensions) do
    dimensions
    |> Stream.map(&String.split(&1, "x"))
    |> Stream.map(fn d ->
      Enum.map(d, &String.to_integer/1)
    end)
    |> Stream.map(&Enum.sort/1)
  end
end
