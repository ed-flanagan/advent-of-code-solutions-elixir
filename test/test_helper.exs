ExUnit.configure(exclude: [long_running: true])
ExUnit.start()

defmodule TestHelper do
  defmacro __using__(_opts) do
    [a, b, c] = Module.split(__CALLER__.module)
    solution_module = Module.concat([a, b, String.trim_trailing(c, "Test")])

    quote do
      use ExUnit.Case, async: true

      import TestHelper
      import unquote(solution_module)
    end
  end

  @spec puzzle_input() :: Enumerable.t()
  defmacro puzzle_input do
    quote do
      puzzle_input_filename()
      |> File.stream!()
      |> Stream.map(&String.trim/1)
    end
  end

  @spec puzzle_input_filename() :: binary()
  defmacro puzzle_input_filename do
    quote do
      [_, mod_year, mod_day] = Module.split(unquote(__CALLER__.module))

      year = mod_year |> String.downcase()
      day = mod_day |> String.downcase() |> String.trim_trailing("test")

      app = Mix.Project.config()[:app]
      Path.join([:code.priv_dir(app), "puzzle_input", year, "#{day}.txt"])
    end
  end

  defmacro aoc_test(opts) do
    opts =
      Keyword.validate!(opts, [
        :example_input,
        p1_example_solution: nil,
        p1_solution: nil,
        p2_example_solution: nil,
        p2_solution: nil
      ])

    example_input = Keyword.fetch!(opts, :example_input)
    p1_example_solution = Keyword.fetch!(opts, :p1_example_solution)
    p2_example_solution = Keyword.fetch!(opts, :p2_example_solution)
    p1_solution = Keyword.fetch!(opts, :p1_solution)
    p2_solution = Keyword.fetch!(opts, :p2_solution)

    quote do
      describe "part one" do
        if unquote(p1_example_solution) != nil do
          test "solves example input" do
            assert part_one(unquote(example_input)) == unquote(p1_example_solution)
          end
        end

        if unquote(p1_solution) != nil do
          test "solves puzzle input" do
            assert part_one(puzzle_input()) == unquote(p1_solution)
          end
        end
      end

      describe "part two" do
        if unquote(p2_example_solution) != nil do
          test "solves example input" do
            assert part_two(unquote(example_input)) == unquote(p2_example_solution)
          end
        end

        if unquote(p2_solution) != nil do
          test "solves puzzle input" do
            assert part_two(puzzle_input()) == unquote(p2_solution)
          end
        end
      end
    end
  end
end
