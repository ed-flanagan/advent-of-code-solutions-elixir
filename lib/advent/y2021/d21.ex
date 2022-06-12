defmodule Advent.Y2021.D21 do
  @moduledoc """
  https://adventofcode.com/2021/day/21
  """

  require Integer

  @doc """
  Play a practice game using the deterministic 100-sided die. The moment either
  player wins, what do you get if you multiply the score of the losing player
  by the number of times the die was rolled during the game?
  """
  @spec part_one(Enumerable.t()) :: integer()
  def part_one(input) do
    start = parse_input(input)

    dice_stream()
    |> Stream.with_index(1)
    |> Enum.reduce_while(start, fn
      {_, turn}, [{_, p1_s}, {_, p2_s}] when p1_s >= 1000 -> {:halt, p2_s * (turn - 1) * 3}
      {_, turn}, [{_, p1_s}, {_, p2_s}] when p2_s >= 1000 -> {:halt, p1_s * (turn - 1) * 3}
      {roll, turn}, [p1, p2] when Integer.is_odd(turn) -> {:cont, [move(p1, roll), p2]}
      {roll, _}, [p1, p2] -> {:cont, [p1, move(p2, roll)]}
    end)
  end

  @doc """
  """
  @spec part_two(any()) :: any()
  def part_two(_input) do
    0
  end

  @spec parse_input(Enumerable.t()) :: [{0..9, 0}]
  defp parse_input(input) do
    Enum.map(input, fn line ->
      [position] =
        Regex.run(~r/Player \d+ starting position: (\d+)/, line, capture: :all_but_first)

      {String.to_integer(position) - 1, 0}
    end)
  end

  defp dice_stream do
    1..100
    |> Stream.cycle()
    |> Stream.chunk_every(3)
    |> Stream.map(&Enum.sum/1)
  end

  defp move({pos, score}, roll) do
    pos = rem(pos + roll, 10)
    score = score + pos + 1
    {pos, score}
  end
end
