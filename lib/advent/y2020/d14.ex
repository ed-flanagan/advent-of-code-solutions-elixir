defmodule Advent.Y2020.D14 do
  @moduledoc """
  https://adventofcode.com/2020/day/14
  """

  import Bitwise

  @mem_match ~r/mem\[(?<addr>\d+)\]\s+=\s+(?<val>\d+)/

  def part_one(input) do
    input
    |> Enum.reduce({%{}, 0b0, 0b0}, fn
      "mask = " <> mask, {mem, _, _} ->
        {m0, m1} = combo_mask(mask)
        {mem, m0, m1}

      mapping, {mem, mask0, mask1} ->
        %{"addr" => addr, "val" => val} = Regex.named_captures(@mem_match, mapping)
        addr = String.to_integer(addr)
        val = String.to_integer(val)

        val = (val &&& mask0) ||| mask1

        {Map.put(mem, addr, val), mask0, mask1}
    end)
    |> elem(0)
    |> Map.values()
    |> Enum.sum()
  end

  defp combo_mask(mask) do
    mask
    |> String.graphemes()
    |> Enum.reduce({0b0, 0b0}, fn c, {m0, m1} ->
      {
        m0 <<< 1 ||| if(c == "0", do: 0, else: 1),
        m1 <<< 1 ||| if(c == "1", do: 1, else: 0)
      }
    end)
  end
end
