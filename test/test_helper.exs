ExUnit.configure(exclude: [long_running: true])
ExUnit.start()

defmodule TestHelper do
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
end
