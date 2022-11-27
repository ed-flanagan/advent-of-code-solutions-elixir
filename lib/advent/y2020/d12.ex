defmodule Advent.Y2020.D12 do
  @moduledoc """
  https://adventofcode.com/2020/day/12
  """

  def part_one(input) do
    input
    |> Stream.map(&split_instruction/1)
    |> Enum.reduce({0, 0, 90}, fn
      # Move North
      {"N", value}, {x, y, deg} -> {x, y + value, deg}
      {"F", value}, {x, y, 0} -> {x, y + value, 0}
      # Move South
      {"S", value}, {x, y, deg} -> {x, y - value, deg}
      {"F", value}, {x, y, 180} -> {x, y - value, 180}
      # Move East
      {"E", value}, {x, y, deg} -> {x + value, y, deg}
      {"F", value}, {x, y, 90} -> {x + value, y, 90}
      # Move West
      {"W", value}, {x, y, deg} -> {x - value, y, deg}
      {"F", value}, {x, y, 270} -> {x - value, y, 270}
      # Rotate
      {"R", value}, {x, y, deg} -> {x, y, rem(deg + value, 360)}
      {"L", value}, {x, y, deg} -> {x, y, rem(360 + deg - value, 360)}
    end)
    |> then(fn {x, y, _} -> manhattan_distance({x, y}) end)
  end

  def part_two(input) do
    input
    |> Stream.map(&split_instruction/1)
    |> Enum.reduce({{0, 0}, {10, 1}}, fn
      # Move waypoint
      {"N", value}, {coords, {x, y}} -> {coords, {x, y + value}}
      {"S", value}, {coords, {x, y}} -> {coords, {x, y - value}}
      {"E", value}, {coords, {x, y}} -> {coords, {x + value, y}}
      {"W", value}, {coords, {x, y}} -> {coords, {x - value, y}}
      # Rotate waypoint (https://en.wikipedia.org/wiki/Rotation_matrix#Common_rotations)
      # 90 clockwise
      {"R", 90}, {coords, {x, y}} -> {coords, {y, -x}}
      {"L", 270}, {coords, {x, y}} -> {coords, {y, -x}}
      # 180
      {"R", 180}, {coords, {x, y}} -> {coords, {-x, -y}}
      {"L", 180}, {coords, {x, y}} -> {coords, {-x, -y}}
      # 90 counter-clockwise
      {"R", 270}, {coords, {x, y}} -> {coords, {-y, x}}
      {"L", 90}, {coords, {x, y}} -> {coords, {-y, x}}
      # Move plane
      {"F", value}, {{px, py}, {wx, wy}} -> {{px + wx * value, py + wy * value}, {wx, wy}}
    end)
    |> then(fn {coords, _} -> manhattan_distance(coords) end)
  end

  defp split_instruction(<<action::binary-size(1), value::binary>>) do
    {action, String.to_integer(value)}
  end

  defp manhattan_distance({x, y}) do
    abs(x) + abs(y)
  end
end
