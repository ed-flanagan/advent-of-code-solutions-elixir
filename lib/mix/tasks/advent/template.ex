defmodule Mix.Tasks.Advent.Template do
  use Mix.Task

  @moduledoc """
  Generate code scaffold for a given day

      mix advent.template <YYYY> <DD>

  Will generate the following files:

  * `lib/advent/yYYYY/dDD.ex`
  * `test/advent/yYYYY/dDD_test.exs`
  * `priv/puzzle_input/yYYYY/dDD.txt`
  """

  @shortdoc "Generate code scaffold for a given day"

  def run([year, day]) do
    [year, day] = date_check(year, day)
    generate_files(year, day)
  end

  @spec generate_files(String.t(), String.t()) :: any()
  defp generate_files(year, day) do
    # Create padded day, e.g. 2 -> "02"
    day_padded = String.pad_leading(day, 2, "0")

    Mix.Generator.create_file(
      "lib/advent/y#{year}/d#{day_padded}.ex",
      EEx.eval_file("priv/templates/advent.template/day.ex.eex",
        year: year,
        day: day,
        day_padded: day_padded
      )
    )

    Mix.Generator.create_file(
      "test/advent/y#{year}/d#{day_padded}_test.exs",
      EEx.eval_file("priv/templates/advent.template/day_test.exs.eex",
        year: year,
        day_padded: day_padded
      )
    )

    Mix.Generator.create_file("priv/puzzle_input/y#{year}/d#{day_padded}.txt", "")
  end

  # Poor date preconditions:
  #   * We check for year range to avoid making impossible requests to API
  #   * We check for day range for the same reason
  #   * However, this doesn't prevent usage a given year _before_ December
  # Normalizes the string numbers passed, e.g. "02" -> "2"
  @spec date_check(String.t(), String.t()) :: [String.t()]
  defp date_check(year, day) do
    year =
      case Integer.parse(year) do
        {year, ""} ->
          current_year = Date.utc_today().year

          unless year in 2015..current_year,
            do: Mix.raise("#{year} is not between 2015-#{current_year}")

          year

        _ ->
          Mix.raise("#{year} is not a valid integer")
      end

    day =
      case Integer.parse(day) do
        {day, ""} ->
          unless day in 1..25, do: Mix.raise("#{day} needs to be 1-25")
          day

        _ ->
          Mix.raise("#{day} is not a valid integer")
      end

    Enum.map([year, day], &Integer.to_string/1)
  end
end
