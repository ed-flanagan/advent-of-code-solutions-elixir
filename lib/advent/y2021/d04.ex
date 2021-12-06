defmodule Advent.Y2021.D04 do
  @moduledoc """
  https://adventofcode.com/2021/day/4
  """

  @doc """
  To guarantee victory against the giant squid, figure out which board will win
  first. What will your final score be if you choose that board?
  """
  def part_one(input) do
    {calls, boards} = parse_input(input)

    {_turn, solution} =
      boards
      |> Enum.map(&board_solution(&1, calls))
      |> Enum.min()

    solution
  end

  @doc """
  Figure out which board will win last. Once it wins, what would its final
  score be?
  """
  def part_two(input) do
    {calls, boards} = parse_input(input)

    {_turn, solution} =
      boards
      |> Enum.map(&board_solution(&1, calls))
      |> Enum.max()

    solution
  end

  @spec parse_input(Enumerable.t()) :: {[integer()], Enumerable.t()}
  defp parse_input(input) do
    called =
      input
      |> Enum.at(0)
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)

    boards =
      input
      |> Stream.drop(2)
      |> Stream.chunk_while(
        [],
        fn
          "", acc -> {:cont, acc, []}
          line, acc -> {:cont, [line | acc]}
        end,
        fn
          [] -> {:cont, []}
          acc -> {:cont, acc, []}
        end
      )
      |> Stream.map(fn card ->
        Enum.map(card, fn row ->
          row
          |> String.split()
          |> Enum.map(&String.to_integer/1)
        end)
      end)
      |> Stream.map(fn rows ->
        cols =
          rows
          |> Enum.zip()
          |> Enum.map(&Tuple.to_list/1)

        {rows, cols}
      end)

    {called, boards}
  end

  @spec board_solution({[[integer()]], integer()}, [integer()]) :: {integer(), integer()}
  defp board_solution({rows, cols}, calls) do
    board_vals =
      rows
      |> List.flatten()
      |> MapSet.new()

    (rows ++ cols)
    |> Enum.map(fn arr ->
      if Enum.all?(arr, &Enum.member?(calls, &1)) do
        last_call = Enum.max_by(arr, fn v -> Enum.find_index(calls, fn c -> c == v end) end)
        last_turn = Enum.find_index(calls, fn c -> c == last_call end)
        seen_calls = Enum.slice(calls, 0..last_turn)
        marked_calls = MapSet.difference(board_vals, MapSet.new(seen_calls))

        solution = Enum.sum(marked_calls) * last_call

        {last_turn, solution}
      else
        nil
      end
    end)
    |> Enum.reject(&is_nil/1)
    |> Enum.min()
  end
end
