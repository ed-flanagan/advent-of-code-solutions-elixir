defmodule Advent.Y2020.D16 do
  @moduledoc """
  https://adventofcode.com/2020/day/16
  """

  @spec part_one(String.t()) :: integer()
  def part_one(input) do
    [rules, _your_ticket, nearby_tickets] = String.split(input, "\n\n")

    rules =
      Regex.scan(~r/(\w+): (\d+)\-(\d+) or (\d+)\-(\d+)/, rules)
      |> Map.new(fn [_match, label, s1, e1, s2, e2] ->
        s1 = String.to_integer(s1)
        e1 = String.to_integer(e1)
        s2 = String.to_integer(s2)
        e2 = String.to_integer(e2)
        {label, {s1..e1, s2..e2}}
      end)

    ranges =
      Enum.reduce(rules, [], fn {_key, {r1, r2}}, acc ->
        [r2, r1 | acc]
      end)

    [_header | nearby_tickets] = String.split(nearby_tickets, "\n", trim: true)

    nearby_tickets =
      Enum.map(nearby_tickets, fn t ->
        String.split(t, ",")
        |> Enum.map(&String.to_integer/1)
      end)

    invalid =
      Enum.flat_map(nearby_tickets, fn ticket ->
        Enum.filter(ticket, fn t ->
          Enum.all?(ranges, fn range -> t not in range end)
        end)
      end)

    Enum.sum(invalid)
  end

  @spec part_two(String.t()) :: integer()
  def part_two(_input) do
    0
  end
end
