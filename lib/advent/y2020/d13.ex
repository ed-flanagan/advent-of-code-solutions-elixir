defmodule Advent.Y2020.D13 do
  @moduledoc """
  https://adventofcode.com/2020/day/13
  """

  def part_one(input) do
    {earliest, ids} =
      input
      |> Enum.to_list()
      |> then(fn [earliest, ids] ->
        {
          String.to_integer(earliest),
          for id <- String.split(ids, ",", trim: true),
              id != "x" do
            String.to_integer(id)
          end
        }
      end)

    ids
    |> Enum.map(fn id ->
      {
        id,
        ceil(earliest / id) * id
      }
    end)
    |> Enum.min_by(&elem(&1, 1))
    |> then(fn {id, time} ->
      (time - earliest) * id
    end)
  end

  def part_two(_input) do
    # Solve for a linear equation for all possible busses, e.g.
    # t = 7x + 0
    # t = 13y + 1
    # t = 59z + 4
    # ...
    0
  end
end
