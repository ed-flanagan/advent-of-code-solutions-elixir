defmodule Advent.Y2020.D15Test do
  use TestHelper

  describe "part_one/1" do
    test "solves example input" do
      [
        {436, [0, 3, 6]},
        {1, [1, 3, 2]},
        {10, [2, 1, 3]},
        {27, [1, 2, 3]},
        {78, [2, 3, 1]},
        {438, [3, 2, 1]},
        {1836, [3, 1, 2]}
      ]
      |> Enum.each(fn {expected, input} ->
        assert expected == part_one(input)
      end)
    end

    test "solves puzzle input" do
      assert 319 == part_one(puzzle_input!())
    end
  end

  describe "part_two/1" do
    @tag long_running: true
    test "solves example input" do
      [
        {175_594, [0, 3, 6]},
        {2578, [1, 3, 2]},
        {3_544_142, [2, 1, 3]},
        {261_214, [1, 2, 3]},
        {6_895_259, [2, 3, 1]},
        {18, [3, 2, 1]},
        {362, [3, 1, 2]}
      ]
      |> Task.async_stream(
        fn {expected, input} ->
          {expected, part_two(input)}
        end,
        timeout: 30 * 1000
      )
      |> Enum.each(fn {:ok, {expected, actual}} ->
        assert actual == expected
      end)
    end

    test "solves puzzle input" do
      assert 2424 == part_two(puzzle_input!())
    end
  end

  defp puzzle_input! do
    puzzle_input()
    |> Enum.at(0)
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end
end
