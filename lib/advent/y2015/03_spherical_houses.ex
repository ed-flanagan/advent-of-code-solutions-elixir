defmodule Advent.Y2015.D03 do
  @spec part_one(input :: charlist()) :: integer()
  def part_one(directions) do
    directions |> deliver_presents() |> MapSet.size()
  end

  @spec part_two(input :: charlist()) :: integer()
  def part_two(directions) do
    santa_seen = directions |> Enum.take_every(2) |> deliver_presents()
    robo_seen = directions |> tl() |> Enum.take_every(2) |> deliver_presents()

    MapSet.union(santa_seen, robo_seen) |> MapSet.size()
  end

  defp deliver_presents(steps) do
    do_deliver_presents(steps, MapSet.new([{0, 0}]), {0, 0})
  end

  defp do_deliver_presents([], seen, _pos), do: seen

  defp do_deliver_presents([dir | tail], seen, {x, y}) do
    pos =
      case dir do
        ?^ -> {x, y + 1}
        ?v -> {x, y - 1}
        ?> -> {x + 1, y}
        ?< -> {x - 1, y}
        _ -> {x, y}
      end

    do_deliver_presents(tail, MapSet.put(seen, pos), pos)
  end
end
