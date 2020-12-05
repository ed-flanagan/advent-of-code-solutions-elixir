defmodule Advent.Y2020.D05 do
  use Bitwise, only_operators: true

  def part_one(passes) do
    highest_id(passes)
  end

  def part_two(passes) do
    find_middle_seat(passes)
  end

  defp find_middle_seat(passes) do
    passes |> sorted_ids() |> do_find_middle_seat()
  end

  # Relies on the list to be sorted
  defp do_find_middle_seat([a, b | _tail]) when b - a == 2, do: a + 1
  defp do_find_middle_seat([_a, b | tail]), do: do_find_middle_seat([b | tail])
  defp do_find_middle_seat(_), do: nil

  defp sorted_ids(passes) do
    passes |> Stream.map(&seat_id/1) |> Enum.sort()
  end

  defp highest_id(passes) do
    passes |> Stream.map(&seat_id/1) |> Enum.max()
  end

  defp seat_id(pass) do
    {row, col} = boarding_pass_coords(pass)
    row * 8 + col
  end

  defp boarding_pass_coords(<<row::binary-size(7), col::binary-size(3)>>) do
    {partition_to_coord(row), partition_to_coord(col)}
  end

  # F, B, R, L represent bits.
  # B = R = 1
  # F = L = 0
  # I'm not sure on what's the "best" approach, so I left the 3 that I came up
  # with. I left the Bitwise one uncommented since I think it's the fanciest.
  # 1. Uses Bitwise and relies that the partitions will be F/B and R/L
  #    exclusive. For each character, shift the sum by one. Then OR 1 at the
  #    new end. This builds out the coordinate integer value
  # 2. Takes the same approach as 1, but uses the ol' sum powers together
  #    approach
  # 3. Maps the string characters to 1/0 respectively then uses to_integer
  #    with base 2

  defp partition_to_coord(partition) do
    partition
    |> String.graphemes()
    |> Enum.reduce(0, fn
      "B", sum -> sum <<< 1 ||| 1
      "R", sum -> sum <<< 1 ||| 1
      _, sum -> sum <<< 1
    end)
  end

  # defp partition_to_coord(partition) do
  #   partition
  #   |> String.graphemes()
  #   |> Enum.reverse()
  #   |> Enum.with_index()
  #   |> Enum.reduce(0, fn
  #     {"B", i}, sum -> sum + :math.pow(2, i)
  #     {"R", i}, sum -> sum + :math.pow(2, i)
  #     _, sum -> sum
  #   end)
  # end

  # defp partition_to_coord(<<row::binary-size(7)>>) do
  #   row
  #   |> String.replace("B", "1")
  #   |> String.replace("F", "0")
  #   |> String.to_integer(2)
  # end

  # defp partition_to_coord(<<col::binary-size(3)>>) do
  #   col
  #   |> String.replace("R", "1")
  #   |> String.replace("L", "0")
  #   |> String.to_integer(2)
  # end
end
