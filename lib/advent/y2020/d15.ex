defmodule Advent.Y2020.D15 do
  @moduledoc """
  https://adventofcode.com/2020/day/15
  """

  def part_one(input) do
    do_challenge_ets(input, 2020)
  end

  def part_two(input) do
    do_challenge_ets(input, 30_000_000)
  end

  # part 2 takes ~19sec on Apple M1 2020
  # defp do_challenge(seed, turns) do
  #   earlier = Enum.with_index(seed, 1)
  #
  #   Stream.unfold({List.last(earlier), Map.new(earlier)}, fn {{last, turn}, spoken} ->
  #     {speak, spoken} =
  #       Map.get_and_update(spoken, last, fn
  #         nil -> {0, turn}
  #         t0 -> {turn - t0, turn}
  #       end)
  #
  #     next = {speak, turn + 1}
  #     {next, {next, spoken}}
  #   end)
  #   |> Enum.reduce_while(nil, fn
  #     {n, ^turns}, _ -> {:halt, n}
  #     _, _ -> {:cont, nil}
  #   end)
  # end

  # part 2 takes ~6sec on Apple M1 2020
  defp do_challenge_ets(seed, turns) do
    earlier = Enum.with_index(seed, 1)

    spoken = :ets.new(:spoken, [])
    true = :ets.insert(spoken, earlier)

    Stream.unfold({List.last(earlier), spoken}, fn {{last, turn}, spoken} ->
      speak =
        case :ets.lookup(spoken, last) do
          [] ->
            true = :ets.insert(spoken, {last, turn})
            0

          [{_, t0}] ->
            true = :ets.insert(spoken, {last, turn})
            turn - t0
        end

      next = {speak, turn + 1}
      {next, {next, spoken}}
    end)
    |> Enum.reduce_while(nil, fn
      {n, ^turns}, _ -> {:halt, n}
      _, _ -> {:cont, nil}
    end)
  end
end
