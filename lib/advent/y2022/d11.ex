defmodule Advent.Y2022.D11 do
  @moduledoc """
  https://adventofcode.com/2022/day/11
  """

  @typep throw_f :: (integer() -> {integer(), integer()})
  @typep monkeys :: %{integer() => {[integer()], throw_f, integer()}}

  @doc """
  Figure out which monkeys to chase by counting how many items they inspect
  over 20 rounds. What is the level of monkey business after 20 rounds of
  stuff-slinging simian shenanigans?
  """
  @spec part_one(Enumerable.t()) :: any()
  def part_one(input) do
    input
    |> parse_input(true)
    |> solve(20)
  end

  @doc """
  Worry levels are no longer divided by three after each item is inspected;
  you'll need to find another way to keep your worry levels manageable.
  Starting again from the initial state in your puzzle input, what is the level
  of monkey business after 10000 rounds?
  """
  @spec part_two(Enumerable.t()) :: any()
  def part_two(input) do
    input
    |> parse_input(false)
    |> solve(10_000)
  end

  @spec make_throw(String.t(), integer(), integer(), integer(), boolean(), integer()) :: throw_f()
  defp make_throw(expr, div, to_t, to_f, div?, lcm) do
    fn item ->
      {new, _} = Code.eval_string(expr, old: item)
      new = if div?, do: div(new, 3), else: new
      new = rem(new, lcm)

      if rem(new, div) == 0,
        do: {to_t, new},
        else: {to_f, new}
    end
  end

  @spec parse_input(Enumerable.t(), boolean()) :: any()
  defp parse_input(input, div?) do
    tokens =
      input
      |> Stream.chunk_while(
        %{},
        fn
          "", acc ->
            {:cont, acc, %{}}

          "Monkey " <> id, acc ->
            id = id |> String.trim_trailing(":") |> String.to_integer()
            {:cont, Map.put(acc, :id, id)}

          "Starting items: " <> items, acc ->
            items = items |> String.split(", ", trim: true) |> Enum.map(&String.to_integer/1)
            {:cont, Map.put(acc, :items, items)}

          "Operation: " <> expr, acc ->
            {:cont, Map.put(acc, :expr, expr)}

          "Test: divisible by " <> div, acc ->
            {:cont, Map.put(acc, :div, String.to_integer(div))}

          "If true: throw to monkey " <> to_t, acc ->
            {:cont, Map.put(acc, :to_t, String.to_integer(to_t))}

          "If false: throw to monkey " <> to_f, acc ->
            {:cont, Map.put(acc, :to_f, String.to_integer(to_f))}
        end,
        &{:cont, &1, %{}}
      )

    lcm =
      tokens
      |> Enum.map(fn %{div: div} -> div end)
      |> Enum.product()

    tokens
    |> Enum.map(fn %{id: id, items: items, expr: expr, div: div, to_t: to_t, to_f: to_f} ->
      throw = make_throw(expr, div, to_t, to_f, div?, lcm)
      {id, {items, throw, 0}}
    end)
    |> Map.new()
  end

  @spec do_round(monkeys()) :: monkeys()
  defp do_round(monkeys) do
    0..(map_size(monkeys) - 1)
    |> Enum.reduce(monkeys, fn idx, monkeys ->
      {{items, throw, _}, monkeys} =
        Map.get_and_update!(monkeys, idx, fn curr = {items, throw, count} ->
          {curr, {[], throw, count + length(items)}}
        end)

      items
      |> Enum.map(&throw.(&1))
      |> Enum.reduce(monkeys, fn {idx, item}, monkeys ->
        {_, monkeys} =
          Map.get_and_update!(monkeys, idx, fn curr = {items, throw, count} ->
            {curr, {items ++ [item], throw, count}}
          end)

        monkeys
      end)
    end)
  end

  @spec solve(monkeys(), pos_integer()) :: integer()
  defp solve(monkeys, rounds) do
    monkeys
    |> Stream.unfold(fn monkeys ->
      {monkeys, do_round(monkeys)}
    end)
    |> Enum.at(rounds)
    |> Enum.map(fn {_, {_, _, count}} -> count end)
    |> Enum.sort(:desc)
    |> Enum.take(2)
    |> Enum.product()
  end
end
