defmodule Advent.Y2021.D07 do
  @moduledoc """
  https://adventofcode.com/2021/day/7
  """

  @doc """
  Determine the horizontal position that the crabs can align to using the least
  fuel possible. How much fuel must they spend to align to that position?
  """
  @spec part_one([integer()]) :: integer()
  def part_one(input) do
    median = median(input)

    Enum.reduce(input, 0, fn x, acc ->
      acc + abs(x - median)
    end)
  end

  @doc """
  Determine the horizontal position that the crabs can align to using the least
  fuel possible so they can make you an escape route! How much fuel must they
  spend to align to that position?
  """
  @spec part_two([integer()]) :: integer()
  def part_two(input) do
    part_two_fuzzy_avg(input)
  end

  # defp part_two_brute_force(input) do
  #   Enum.reduce_while(Enum.min(input)..Enum.max(input), :infinity, fn m, lowest ->
  #     result =
  #       Enum.reduce(input, 0, fn x, acc ->
  #         acc + sum_consecutive_ints(abs(x - m))
  #       end)
  #
  #     if result > lowest do
  #       {:halt, lowest}
  #     else
  #       {:cont, result}
  #     end
  #   end)
  # end

  @spec part_two_fuzzy_avg([integer()]) :: integer()
  defp part_two_fuzzy_avg(input) do
    avg = mean(input)

    Enum.map(floor(avg)..ceil(avg), fn m ->
      Enum.reduce(input, 0, fn x, acc ->
        acc + sum_consecutive_ints(abs(x - m))
      end)
    end)
    |> Enum.min()
  end

  @spec median([integer()]) :: integer()
  defp median(vals) do
    vals
    |> Enum.sort()
    |> Enum.at(div(length(vals), 2))
  end

  @spec mean([integer()]) :: float()
  defp mean(vals) do
    Enum.sum(vals) / length(vals)
  end

  @spec sum_consecutive_ints(pos_integer()) :: pos_integer()
  defp sum_consecutive_ints(n) when n >= 0 do
    div(n * (n + 1), 2)
  end
end
