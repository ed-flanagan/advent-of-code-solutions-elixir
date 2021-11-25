defmodule Advent.Y2020.D08 do
  @moduledoc """
  https://adventofcode.com/2020/day/8
  """

  @typep instruction :: {:nop | :acc | :jmp, integer()}
  @typep line_no :: non_neg_integer()
  @typep instructions :: %{line_no() => instruction()}

  @doc """
  What value is in the accumulator?
  """
  @spec part_one(Enumerable.t()) :: integer()
  def part_one(input) do
    {:loop, acc} =
      input
      |> map_instructions()
      |> execute()

    acc
  end

  @doc """
  What is the value of the accumulator after the program terminates?
  """
  @spec part_two(Enumerable.t()) :: integer()
  def part_two(input) do
    input
    |> map_instructions()
    |> no_cycle_execute()
  end

  @spec map_instructions(Enumerable.t()) :: instructions()
  defp map_instructions(lines) do
    lines
    |> Stream.map(fn line ->
      [cmd_str, val_str] = String.split(line, " ")

      cmd =
        case cmd_str do
          "nop" -> :nop
          "jmp" -> :jmp
          "acc" -> :acc
        end

      val = String.to_integer(val_str)

      {cmd, val}
    end)
    |> Stream.with_index()
    |> Map.new(fn {ins, lno} -> {lno, ins} end)
  end

  @spec execute(instructions()) :: {:ok | :loop, integer()}
  defp execute(lines) do
    do_execute(lines, 0, 0, map_size(lines))
  end

  @spec do_execute(instructions(), line_no(), non_neg_integer(), non_neg_integer()) ::
          {:ok | :loop, integer()}
  defp do_execute(_lines, line_no, acc, size) when line_no >= size do
    {:ok, acc}
  end

  defp do_execute(lines, line_no, acc, size) do
    case Map.pop(lines, line_no) do
      {{:nop, _val}, lines} -> do_execute(lines, line_no + 1, acc, size)
      {{:acc, val}, lines} -> do_execute(lines, line_no + 1, acc + val, size)
      {{:jmp, val}, lines} -> do_execute(lines, line_no + val, acc, size)
      {nil, _lines} -> {:loop, acc}
    end
  end

  @spec no_cycle_execute(instructions()) :: integer()
  defp no_cycle_execute(instructions) do
    case execute(instructions) do
      {:ok, acc} ->
        acc

      {:loop, _acc} ->
        Enum.find_value(instructions, fn
          {lno, {:nop, val}} -> exec_flip(instructions, {lno, {:jmp, val}})
          {lno, {:jmp, val}} -> exec_flip(instructions, {lno, {:nop, val}})
          _ -> nil
        end)
    end
  end

  @spec exec_flip(instructions(), {line_no(), instruction()}) :: integer() | nil
  defp exec_flip(ins, {lno, flip}) do
    case execute(%{ins | lno => flip}) do
      {:ok, val} -> val
      _ -> nil
    end
  end
end
