defmodule Advent.Y2015.D03 do
  @spec part_one(input :: charlist()) :: integer()
  def part_one(directions) do
    seen = deliver_presents(directions)
    MapSet.size(seen)
  end

  def part_two(directions) do
    santa_steps = directions |> Enum.take_every(2)
    robo_steps = directions |> tl() |> Enum.take_every(2)

    santa_seen = deliver_presents(santa_steps)
    robo_seen = deliver_presents(robo_steps)

    total_seen = MapSet.union(santa_seen, robo_seen)
    MapSet.size(total_seen)
  end

  @spec deliver_presents(steps :: charlist()) :: MapSet.t()
  defp deliver_presents(steps) do
    do_deliver_presents(steps, MapSet.new([{0, 0}]), {0, 0})
  end

  @spec do_deliver_presents(
          steps :: charlist(),
          seen :: MapSet.t(),
          pos :: tuple()
        ) :: MapSet.t()
  defp do_deliver_presents([], seen, _pos), do: seen

  defp do_deliver_presents([?^ | tail], seen, {x, y}) do
    pos = {x, y + 1}
    do_deliver_presents(tail, MapSet.put(seen, pos), pos)
  end

  defp do_deliver_presents([?v | tail], seen, {x, y}) do
    pos = {x, y - 1}
    do_deliver_presents(tail, MapSet.put(seen, pos), pos)
  end

  defp do_deliver_presents([?> | tail], seen, {x, y}) do
    pos = {x + 1, y}
    do_deliver_presents(tail, MapSet.put(seen, pos), pos)
  end

  defp do_deliver_presents([?< | tail], seen, {x, y}) do
    pos = {x - 1, y}
    do_deliver_presents(tail, MapSet.put(seen, pos), pos)
  end
end
