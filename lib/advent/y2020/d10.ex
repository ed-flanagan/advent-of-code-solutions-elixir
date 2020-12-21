defmodule Advent.Y2020.D10 do
  def part_one(input) do
    input
    |> Stream.map(&String.to_integer/1)
    |> Enum.sort()
    |> Enum.reduce({0, 0, 0, 1}, fn adptr, {pa, n1, n2, n3} ->
      case adptr - pa do
        3 -> {adptr, n1, n2, n3 + 1}
        2 -> {adptr, n1, n2 + 1, n3}
        1 -> {adptr, n1 + 1, n2, n3}
        _ -> {adptr, n1, n2, n3}
      end
    end)
    |> (fn {_, num_one, _, num_three} -> num_one * num_three end).()
  end

  def part_two(input) do
    0
  end
end
