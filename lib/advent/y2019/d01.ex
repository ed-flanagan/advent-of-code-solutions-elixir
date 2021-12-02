defmodule Advent.Y2019.D01 do
  @moduledoc """
  https://adventofcode.com/2019/day/1
  """

  @spec part_one(Enumerable.t()) :: integer()
  def part_one(input) do
    input
    |> Stream.map(&module_fuel/1)
    |> Enum.sum()
  end

  @spec part_two(Enumerable.t()) :: integer()
  def part_two(input) do
    input
    |> Stream.map(fn mass ->
      Stream.unfold(module_fuel(mass), fn
        m when m > 0 -> {m, module_fuel(m)}
        _ -> nil
      end)
      |> Enum.sum()
    end)
    |> Enum.sum()
  end

  defp module_fuel(mass), do: div(mass, 3) - 2
end
