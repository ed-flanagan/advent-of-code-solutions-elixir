defmodule Advent.Y2021.D03 do
  @moduledoc """
  https://adventofcode.com/2021/day/3
  """

  import Bitwise

  @doc """
  """
  @spec part_one(Enumerable.t()) :: integer()
  def part_one(input) do
    input = parse_input(input)

    mcb = most_common_bits(input)

    max_val = (1 <<< length(mcb)) - 1
    gamma = Integer.undigits(mcb, 2)
    epsilon = max_val - gamma

    gamma * epsilon
  end

  @doc """
  """
  @spec part_two(Enumerable.t()) :: integer()
  def part_two(input) do
    input = parse_input(input)

    find_o2(input) * find_co2(input)
  end

  @spec most_common_bits(Enumerable.t()) :: [0 | 1]
  defp most_common_bits(input) do
    input
    |> Stream.map(fn bits ->
      Enum.map(bits, fn
        1 -> 1
        0 -> -1
      end)
    end)
    |> Enum.reduce(fn bin, acc ->
      Enum.zip_with(acc, bin, &+/2)
    end)
    |> Enum.map(fn
      b when b > 0 -> 1
      b when b < 0 -> 0
      0 -> -1
    end)
  end

  defp find_o2(input), do: find_life_support(input, :o2)

  defp find_co2(input), do: find_life_support(input, :co2)

  @spec find_life_support(Enumerable.t(), :o2 | :co2) :: integer()
  defp find_life_support(values, strat) do
    Stream.unfold({values, 0}, fn
      {[], _} ->
        nil

      {[final], _} ->
        {[final], {[], nil}}

      {values, idx} ->
        mcb = most_common_bits(values)
        cb = Enum.at(mcb, idx)

        remaining =
          Enum.filter(values, fn v ->
            b = Enum.at(v, idx)

            # ugly
            case strat do
              :o2 -> b == cb || (cb == -1 && b == 1)
              :co2 -> (b != cb && cb != -1) || (cb == -1 && b == 0)
            end
          end)

        {values, {remaining, idx + 1}}
    end)
    |> Enum.reduce_while(nil, fn
      [final], _ -> {:halt, final}
      _, _ -> {:cont, nil}
    end)
    |> Integer.undigits(2)
  end

  defp parse_input(input) do
    input
    |> Stream.map(&String.to_charlist/1)
    |> Stream.map(fn bits ->
      Enum.map(bits, fn
        ?1 -> 1
        ?0 -> 0
      end)
    end)
  end
end
