defmodule Advent.Y2017.D01 do
  @spec part_one(input :: String.t()) :: integer()
  def part_one(input) do
    (input <> String.first(input))
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
    |> sum_pairs
  end

  defp sum_pairs(list), do: do_sum_pairs(list, 0)

  defp do_sum_pairs([], sum), do: sum

  defp do_sum_pairs([a, a | tail], sum) do
    do_sum_pairs([a | tail], sum + a)
  end

  defp do_sum_pairs([_head | tail], sum) do
    do_sum_pairs(tail, sum)
  end
end
