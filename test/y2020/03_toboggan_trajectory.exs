defmodule Advent.Y2020.D03Test do
  use ExUnit.Case

  alias Advent.Y2020.D03
  import D03, only: [part_one: 1, part_two: 2]

  @example [
    "..##.......",
    "#...#...#..",
    ".#....#..#.",
    "..#.#...#.#",
    ".#...##..#.",
    "..#.##.....",
    ".#.#.#....#",
    ".#........#",
    "#.##...#...",
    "#...##....#",
    ".#..#...#.#"
  ]

  # {right, down}
  @strategies [
    {1, 1},
    {3, 1},
    {5, 1},
    {7, 1},
    {1, 2}
  ]

  describe "part_one/1" do
    test "solves example input" do
      assert 7 == part_one(@example)
    end

    test "solves puzzle input" do
      assert 280 == part_one(puzzle_input!())
    end
  end

  describe "part_two/2" do
    test "solves example input" do
      assert 336 == part_two(@example, @strategies)
    end

    test "solves puzzle input" do
      assert 4_355_551_200 == part_two(puzzle_input!(), @strategies)
    end
  end

  defp puzzle_input!() do
    Path.join([__DIR__, "support", "03_input.txt"])
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end
end
