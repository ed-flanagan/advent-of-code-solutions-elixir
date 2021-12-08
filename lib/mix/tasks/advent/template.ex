defmodule Mix.Tasks.Advent.Template do
  use Mix.Task

  @moduledoc """
  Generate code scaffold for a given day

      mix advent.template <YYYY> <DD>

  Will generate the following files:

  * `lib/advent/yYYYY/dDD.ex`
  * `test/advent/yYYYY/dDD_test.exs`
  * `test/advent/yYYYY/support/dDD_input.txt`
  """

  @shortdoc "Generate code scaffold for a given day"

  def run([year, day]) do
    year = String.to_integer(year)
    day = String.to_integer(day)

    generate_files(year, day)
  end

  @spec generate_files(integer(), integer()) :: :ok
  defp generate_files(year, day) do
    rel_project_root = Path.join([__DIR__, "..", "..", "..", ".."])
    rel_template_dir = Path.join([__DIR__, "templates"])

    # Create padded day, e.g. 2 -> "02"
    day_padded_str = day |> Integer.to_string() |> String.pad_leading(2, "0")

    # Generate source code template
    rel_lib_dir = Path.join([rel_project_root, "lib", "advent", "y#{year}"])
    rel_lib_file = Path.join([rel_lib_dir, "d#{day_padded_str}.ex"])

    if not File.exists?(rel_lib_file) do
      :ok = File.mkdir_p(rel_lib_dir)

      template_file = Path.join([rel_template_dir, "day.ex.eex"])
      gen_out = EEx.eval_file(template_file, year: year, day: day, day_padded: day_padded_str)
      :ok = File.write(rel_lib_file, gen_out)
    end

    # Generate test file
    rel_test_dir = Path.join([rel_project_root, "test", "advent", "y#{year}"])
    rel_test_file = Path.join([rel_test_dir, "d#{day_padded_str}_test.exs"])

    if not File.exists?(rel_test_file) do
      :ok = File.mkdir_p(rel_test_dir)

      template_file = Path.join([rel_template_dir, "day_test.exs.eex"])
      gen_out = EEx.eval_file(template_file, year: year, day_padded: day_padded_str)
      :ok = File.write(rel_test_file, gen_out)
    end

    # "Touch" input file
    rel_test_support_dir = Path.join([rel_test_dir, "support"])
    rel_test_input_file = Path.join([rel_test_support_dir, "d#{day_padded_str}_input.txt"])

    if not File.exists?(rel_test_input_file) do
      :ok = File.mkdir_p(rel_test_support_dir)
      :ok = File.write(rel_test_input_file, [])
    end

    :ok
  end
end
