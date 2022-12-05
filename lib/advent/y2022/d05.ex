defmodule Advent.Y2022.D05 do
  @moduledoc """
  https://adventofcode.com/2022/day/5
  """

  @typep crates :: %{required(integer()) => [String.t()]}

  @doc """
  For the CrateMover 9000:
  After the rearrangement procedure completes, what crate ends up on top of
  each stack?
  """
  @spec part_one(Enumerable.t()) :: String.t()
  def part_one(input) do
    input
    |> parse_input()
    |> solve(:"9000")
  end

  @doc """
  For the CrateMover 9001:
  After the rearrangement procedure completes, what crate ends up on top of
  each stack?
  """
  @spec part_two(Enumerable.t()) :: String.t()
  def part_two(input) do
    input
    |> parse_input()
    |> solve(:"9001")
  end

  @spec parse_input(Enum.t()) :: {crates(), Enumerable.t()}
  defp parse_input(input) do
    crates =
      input
      |> Enum.take_while(&(!String.starts_with?(&1, " 1")))
      |> Enum.map(fn row ->
        # Alt.: String.split(row, ["    ", " "])
        Regex.scan(~r/\[([A-Z])\]|\s{4}/, row)
        |> Enum.with_index(1)
        |> Enum.reduce(Map.new(), fn
          {[_, crate], stack}, acc -> Map.put(acc, stack, [crate])
          _, acc -> acc
        end)
      end)
      |> Enum.reduce(Map.new(), &Map.merge(&2, &1, fn _, a, r -> a ++ r end))

    steps =
      input
      |> Stream.drop_while(&(!String.starts_with?(&1, "move")))
      |> Stream.map(fn step ->
        # Alt.: pattern matching:
        # credo:disable-for-lines:2
        # "move " <> <<count::binary-size(1)>> <> " from " <> <<from::binary-size(1)>> <> " to " <> <<to::binary-size(1)>>
        # "move " <> <<count::binary-size(2)>> <> " from " <> <<from::binary-size(1)>> <> " to " <> <<to::binary-size(1)>>
        Regex.scan(~r/\d+/, step) |> List.flatten() |> Enum.map(&String.to_integer/1)
      end)

    {crates, steps}
  end

  @spec solve({crates(), Enumerable.t()}, :"9000" | :"9001") :: String.t()
  defp solve({crates, steps}, crane) do
    steps
    |> Enum.reduce(crates, fn [count, from, to], crates ->
      {to_move, crates} = Map.get_and_update(crates, from, &Enum.split(&1, count))
      Map.update(crates, to, [], &(grab(to_move, crane) ++ &1))
    end)
    |> Enum.sort()
    |> Enum.map_join(fn {_, [c | _]} -> c end)
  end

  @spec grab([String.t()], :"9000" | :"9001") :: [String.t()]
  defp grab(crates, :"9000"), do: Enum.reverse(crates)
  defp grab(crates, :"9001"), do: crates
end
