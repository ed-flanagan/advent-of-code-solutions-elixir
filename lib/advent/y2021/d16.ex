defmodule Advent.Y2021.D16 do
  @moduledoc """
  https://adventofcode.com/2021/day/16
  """

  use Bitwise, only_operators: true

  @typep packet :: {integer(), integer(), any(), bitstring()}

  @doc """
  Decode the structure of your hexadecimal-encoded BITS transmission; what do
  you get if you add up the version numbers in all packets?
  """
  @spec part_one(String.t()) :: integer()
  def part_one(input) do
    input
    |> parse_input()
    |> parse_packet()
    |> sum_versions()
  end

  @doc """
  What do you get if you evaluate the expression represented by your
  hexadecimal-encoded BITS transmission?
  """
  @spec part_two(String.t()) :: any()
  def part_two(input) do
    input
    |> parse_input()
    |> parse_packet()
    |> eval_packet()
  end

  @spec parse_input(String.t()) :: bitstring()
  defp parse_input(input) do
    int = String.to_integer(input, 16)
    num_bits = div(bit_size(input), 2)
    <<int::size(num_bits)>>
  end

  @spec parse_packet(bitstring()) :: packet()
  defp parse_packet(<<version::3-integer, type::3-integer, rest::bitstring>>) do
    {decoded, rest} =
      case type do
        4 -> decode_literal(rest)
        _ -> decode_operator(rest)
      end

    {version, type, decoded, rest}
  end

  @spec decode_literal(bitstring(), integer()) :: {integer(), bitstring()}
  defp decode_literal(<<msb::1, nibble::4-integer, rest::bitstring>>, val \\ 0) do
    val = val <<< 4 ||| nibble

    case msb do
      0 -> {val, rest}
      1 -> decode_literal(rest, val)
    end
  end

  @spec decode_operator(bitstring()) :: {[any()], bitstring()}
  defp decode_operator(<<0::1, packet_len::15-integer, rest::bitstring>>) do
    <<packet::bits-size(packet_len), rest::bitstring>> = rest

    packets =
      Stream.unfold(packet, fn
        <<>> ->
          nil

        packet ->
          {v, t, a, rest} = parse_packet(packet)
          {{v, t, a, nil}, rest}
      end)
      |> Enum.to_list()

    {packets, rest}
  end

  defp decode_operator(<<1::1, num_packets::11-integer, rest::bitstring>>) do
    Enum.reduce_while(num_packets..0, {[], rest}, fn
      0, {acc, rest} ->
        {:halt, {Enum.reverse(acc), rest}}

      _, {acc, rest} ->
        {v, t, a, rest} = parse_packet(rest)
        {:cont, {[{v, t, a, nil} | acc], rest}}
    end)
  end

  @spec sum_versions(packet(), integer()) :: integer()
  defp sum_versions({version, _type, value, _rest}, sum \\ 0) do
    sum = sum + version

    case value do
      v when is_list(v) -> Enum.reduce(v, sum, &sum_versions/2)
      _ -> sum
    end
  end

  @spec eval_packet(packet()) :: integer()
  defp eval_packet({_version, 4, value, _rest}), do: value

  defp eval_packet({_version, type, values, _rest}) do
    values = Enum.map(values, &eval_packet/1)

    case type do
      0 -> Enum.sum(values)
      1 -> Enum.product(values)
      2 -> Enum.min(values)
      3 -> Enum.max(values)
      5 -> if hd(values) > List.last(values), do: 1, else: 0
      6 -> if hd(values) < List.last(values), do: 1, else: 0
      7 -> if hd(values) == List.last(values), do: 1, else: 0
    end
  end
end
