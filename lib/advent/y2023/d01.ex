defmodule Advent.Y2023.D01 do
  @moduledoc """
  https://adventofcode.com/2023/day/1
  """

  @doc """
  What is the sum of all of the calibration values?
  """
  @spec part_one(Enumerable.t()) :: pos_integer()
  def part_one(input) do
    input
    |> parse_input()
    |> Stream.map(&String.to_charlist/1)
    |> Stream.map(fn l ->
      Enum.filter(l, fn c -> c in ?0..?9 end)
    end)
    |> Stream.map(&[List.first(&1), List.last(&1)])
    |> Stream.map(&List.to_integer/1)
    |> Enum.sum()
  end

  @doc """
  What is the sum of all of the calibration values?
  """
  @spec part_two(Enumerable.t()) :: pos_integer()
  def part_two(input) do
    input
    |> parse_input()
    |> Stream.map(&extract_numbers/1)
    |> Stream.map(&[List.first(&1), List.last(&1)])
    |> Stream.map(&Integer.undigits/1)
    |> Enum.sum()
  end

  @spec parse_input(Enumerable.t()) :: Enumerable.t()
  defp parse_input(input) do
    Stream.map(input, &String.trim/1)
  end

  @spec extract_numbers(Enumerable.t()) :: [integer()]
  defp extract_numbers(input) do
    extract_numbers(input, [])
  end

  defp extract_numbers("", nums), do: Enum.reverse(nums)

  %{
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9
  }
  |> Enum.map(fn {word, num} ->
    defp extract_numbers(unquote(word) <> rest, nums) do
      extract_numbers(unquote(String.last(word)) <> rest, [unquote(num) | nums])
    end
  end)

  defp extract_numbers(<<char::binary-1>> <> rest, nums) do
    case Integer.parse(char) do
      {int, ""} -> extract_numbers(rest, [int | nums])
      _ -> extract_numbers(rest, nums)
    end
  end
end
