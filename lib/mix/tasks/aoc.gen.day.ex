defmodule Mix.Tasks.Aoc.Gen.Day do
  @shortdoc "Generate code scaffold for a given day"

  @moduledoc """
  Generate code scaffold for a given day

      mix aoc.gen.day <YYYY> <DD> [--session TOKEN]

  ## Options

    * `--session` - pass your login session token to
      retrieve your personal puzzle input

  ## Examples

      $ mix aoc.gen.day 2022 12

  Will generate the following files:

  * `lib/advent/y2022/d12.ex`
  * `test/advent/y2022/d12_test.exs`
  * `priv/static/puzzle_input/y2022/d12.txt` (empty)

  """

  require Logger

  use Mix.Task

  @impl Mix.Task
  def run([year, day | argv]) do
    [year, day] = check_date(year, day)

    {opts, _, _} = OptionParser.parse(argv, strict: [session: :string])

    generate_files(year, day, opts)
  end

  # Fix `unknown registry: Req.Finch` error Req throws
  @requirements ["app.start"]
  @spec generate_files(String.t(), String.t(), keyword()) :: any()
  defp generate_files(year, day, opts) do
    opts = Keyword.validate!(opts, session: nil)

    # Create padded day, e.g. 2 -> "02"
    day_padded = String.pad_leading(day, 2, "0")

    Mix.Generator.create_file(
      "lib/advent/y#{year}/d#{day_padded}.ex",
      EEx.eval_file("priv/templates/aoc.gen.day/day.ex.eex",
        year: year,
        day: day,
        day_padded: day_padded
      )
    )

    Mix.Generator.create_file(
      "test/advent/y#{year}/d#{day_padded}_test.exs",
      EEx.eval_file("priv/templates/aoc.gen.day/day_test.exs.eex",
        year: year,
        day_padded: day_padded
      )
    )

    puzzle_input =
      case Keyword.get(opts, :session) do
        nil ->
          ""

        session ->
          res =
            Req.get!("https://adventofcode.com/#{year}/day/#{day}/input",
              # https://www.reddit.com/r/adventofcode/comments/z9dhtd/please_include_your_contact_info_in_the_useragent/
              headers: %{
                user_agent:
                  "github.com/ed-flanagan/advent-of-code-solutions-elixir by ed@flanagan.xyz",
                cookie: "session=#{session}"
              }
            )

          case res.status do
            200 ->
              res.body

            _ ->
              Logger.error(res.body, status_code: res.status)
              ""
          end
      end

    # Make an input file regardless if a session toke is provided or not (just
    # may be empty)
    Mix.Generator.create_file("priv/puzzle_input/y#{year}/d#{day_padded}.txt", puzzle_input)
  end

  # Some (poor) date preconditions:
  #   * Idea is to avoid making impossible API requests
  #   * Check for valid year
  #   * Check for valid day
  #   * Check if day has occured yet (i.e. not future)
  # Normalizes the string numbers passed, e.g. "02" -> "2"
  # Note that if you pass in your own date, these checks may not behave as
  # expected
  @spec check_date(String.t(), String.t(), DateTime.t()) :: [String.t()]
  defp check_date(year, day, now \\ DateTime.utc_now()) do
    year = check_year(year, now)
    day = check_day(day, year)

    # Cheating to represent midnight EST/UTC-5
    # https://adventofcode.com/2023/about
    {:ok, puzzle_release} = DateTime.new(Date.new!(year, 12, day), ~T[05:00:00], "Etc/UTC")

    if DateTime.before?(now, puzzle_release) do
      Mix.raise("The date you provided hasn't occured yet.")
    end

    Enum.map([year, day], &Integer.to_string/1)
  end

  defp check_year(year, now) do
    case Integer.parse(year) do
      {year, ""} when year not in 2015..now.year//1 ->
        Mix.raise("#{year} is not between 2015-#{now.year}")

      {year, ""} ->
        year

      _ ->
        Mix.raise("#{year} is not a valid integer")
    end
  end

  defp check_day(day, year) do
    case Integer.parse(day) do
      {day, ""} when year >= 2025 and day not in 1..12 ->
        Mix.raise("Day (#{day}) needs to be 1-12 (years 2025 and on)")

      {day, ""} when day not in 1..25 ->
        Mix.raise("Day (#{day}) needs to be 1-25")

      {day, ""} ->
        day

      _ ->
        Mix.raise("#{day} is not a valid integer")
    end
  end
end
