defmodule Advent.Y2020.D08 do
  def part_one(input) do
    input
    |> map_instructions()
    |> execute()
    |> case do
      {_status, acc, _remaining} -> acc
    end
  end

  def part_two(input) do
    input
    |> map_instructions()
    |> no_cycle_execute()
  end

  defp map_instructions(lines) do
    lines
    |> Stream.map(fn line ->
      [cmd, val] = String.split(line, " ")
      {cmd, String.to_integer(val)}
    end)
    |> Stream.with_index()
    |> Enum.into(%{}, fn {instruction, line_no} -> {line_no, instruction} end)
  end

  defp execute(lines) do
    do_execute(lines, 0, 0, map_size(lines))
  end

  defp do_execute(lines, line_no, acc, size) when line_no >= size do
    {:ok, acc, lines}
  end

  defp do_execute(lines, line_no, acc, size) do
    case Map.pop(lines, line_no) do
      {{"nop", _val}, lines} -> do_execute(lines, line_no + 1, acc, size)
      {{"acc", val}, lines} -> do_execute(lines, line_no + 1, acc + val, size)
      {{"jmp", val}, lines} -> do_execute(lines, line_no + val, acc, size)
      {nil, _lines} -> {:loop, acc, lines}
    end
  end

  defp no_cycle_execute(instructions) do
    case execute(instructions) do
      {:ok, acc, _remaining} ->
        acc

      {:loop, _acc, remaining} ->
        # https://erlang.org/doc/efficiency_guide/retired_myths.html#myth--list-subtraction-------operator--is-slow
        for {lno, ins} <- Map.take(instructions, Map.keys(instructions) -- Map.keys(remaining)),
            match?({"nop", _}, ins) || match?({"jmp", _}, ins) do
          case ins do
            {"nop", val} -> {lno, {"jmp", val}}
            {"jmp", val} -> {lno, {"nop", val}}
          end
        end
        |> Enum.reduce_while(nil, fn {line_no, instruction}, acc ->
          Map.put(instructions, line_no, instruction)
          |> execute()
          |> case do
            {:ok, val, _remaining} -> {:halt, val}
            _ -> {:cont, acc}
          end
        end)
    end
  end
end
