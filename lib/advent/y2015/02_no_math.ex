defmodule Advent.Y2015.D02 do
  @doc """
  Process:
  1. Split each line by "x"
  2. Convert each dimension to an integer
  3. Sort the dimension values
  4. Calculate the total area needed
      * Surface area
      * Surface area of one of the smallest sides (why sorted)
  5. Sum all surface areas together
  """
  @spec part_one(dimensions :: Enumerable.t()) :: integer()
  def part_one(dimensions) do
    dimensions
    |> Stream.map(&String.split(&1, "x"))
    |> Stream.map(fn d ->
      Enum.map(d, &String.to_integer/1)
    end)
    |> Stream.map(&Enum.sort/1)
    |> Stream.map(fn [x, y, z] ->
      surface_area = 2 * (x * y + x * z + y * z)
      slack_area = x * y
      surface_area + slack_area
    end)
    |> Enum.sum()
  end

  def part_two(dimensions) do
  end
end
