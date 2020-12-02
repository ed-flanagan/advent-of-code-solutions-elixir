defmodule Advent.Y2015.D03 do
  @spec part_one(input :: charlist()) :: integer()
  def part_one(directions) do
    directions
    |> deliver_presents
    |> MapSet.size()
  end

  @spec part_two(input :: charlist()) :: integer()
  def part_two(directions) do
    santa_steps = directions |> Enum.take_every(2)
    robo_steps = directions |> tl() |> Enum.take_every(2)

    santa_seen = deliver_presents(santa_steps)
    robo_seen = deliver_presents(robo_steps)

    total_seen = MapSet.union(santa_seen, robo_seen)
    MapSet.size(total_seen)
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
