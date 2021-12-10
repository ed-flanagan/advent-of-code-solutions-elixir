defmodule Advent.Y2021.D10 do
  @moduledoc """
  https://adventofcode.com/2021/day/10
  """

  @doc """
  Find the first illegal character in each corrupted line of the navigation
  subsystem. What is the total syntax error score for those errors?
  """
  @spec part_one(Enumerable.t()) :: non_neg_integer()
  def part_one(input) do
    input
    |> parse_input()
    |> Stream.map(fn
      {:corrupted, score} -> score
      _ -> 0
    end)
    |> Enum.sum()
  end

  @doc """
  Find the completion string for each incomplete line, score the completion
  strings, and sort the scores. What is the middle score?
  """
  @spec part_two(Enumerable.t()) :: non_neg_integer()
  def part_two(input) do
    input
    |> parse_input()
    |> Enum.reduce([], fn
      {:incomplete, score}, acc -> [score | acc]
      _, acc -> acc
    end)
    |> Enum.sort()
    # Get middle value - assumed to be odd length (median)
    |> (&Enum.at(&1, div(length(&1), 2))).()
  end

  @spec parse_input(Enumerable.t()) :: Enumerable.t()
  defp parse_input(input) do
    input
    |> Stream.map(&String.graphemes/1)
    |> Stream.map(&parse_chunks/1)
  end

  @spec parse_chunks([String.grapheme()]) ::
          :legal | {:corrupted, non_neg_integer()} | {:incomplete, non_neg_integer()}
  defp parse_chunks(chunks) do
    Enum.reduce_while(chunks, [], fn
      ")", ["(" | tail] -> {:cont, tail}
      "]", ["[" | tail] -> {:cont, tail}
      "}", ["{" | tail] -> {:cont, tail}
      ">", ["<" | tail] -> {:cont, tail}
      ")", _stack -> {:halt, 3}
      "]", _stack -> {:halt, 57}
      "}", _stack -> {:halt, 1197}
      ">", _stack -> {:halt, 25_137}
      open, stack -> {:cont, [open | stack]}
    end)
    |> case do
      [] -> :legal
      res when is_list(res) -> {:incomplete, score_incomplete(res)}
      res when is_integer(res) -> {:corrupted, res}
    end
  end

  @spec score_incomplete([String.grapheme()]) :: non_neg_integer()
  defp score_incomplete(incomplete) do
    Enum.reduce(incomplete, 0, fn chunk, acc ->
      acc * 5 +
        case chunk do
          "(" -> 1
          "[" -> 2
          "{" -> 3
          "<" -> 4
        end
    end)
  end
end
