defmodule Advent.Y2022.D07 do
  @moduledoc """
  https://adventofcode.com/2022/day/7
  """

  @doc """
  Find all of the directories with a total size of at most 100000. What is the
  sum of the total sizes of those directories?
  """
  @spec part_one(Enumerable.t()) :: non_neg_integer()
  def part_one(input) do
    input
    # My initial impl had parsing/filter/sum bundled into one function. However,
    # I split out parsing to make more generic for part 2
    |> parse_input()
    |> Enum.filter(&(&1 <= 100_000))
    |> Enum.sum()
  end

  @doc """
  Find the smallest directory that, if deleted, would free up enough space on
  the filesystem to run the update. What is the total size of that directory?
  """
  @spec part_two(Enumerable.t()) :: non_neg_integer()
  def part_two(input) do
    [root | children] = parse_input(input)
    to_free = root - 40_000_000

    children
    |> Enum.filter(&(&1 >= to_free))
    |> Enum.min()
  end

  defp parse_input(input) do
    parse_input(Enum.to_list(input), [], [])
  end

  defp parse_input(["$ cd .." | tail], [cwd, parent | parents], acc) do
    parse_input(tail, [cwd + parent | parents], [cwd | acc])
  end

  defp parse_input(["$ cd " <> _ | tail], parents, acc) do
    parse_input(tail, [0 | parents], acc)
  end

  # Skip these
  defp parse_input(["$ ls" | tail], parents, acc), do: parse_input(tail, parents, acc)
  defp parse_input(["dir " <> _ | tail], parents, acc), do: parse_input(tail, parents, acc)

  defp parse_input([file | tail], [cwd | parents], acc) do
    [fsize, _] = String.split(file)
    parse_input(tail, [cwd + String.to_integer(fsize) | parents], acc)
  end

  defp parse_input([], [], acc), do: acc
  defp parse_input([], [root], acc), do: [root | acc]

  defp parse_input([], [cwd, parent | parents], acc) do
    parse_input([], [cwd + parent | parents], [cwd | acc])
  end
end
