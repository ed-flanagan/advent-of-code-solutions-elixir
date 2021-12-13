# 🎄 [Advent of Code](https://adventofcode.com/) solutions in [Elixir](https://elixir-lang.org/) ⚗️

My personal solutions to AoC puzzles, in Elixir.

## Caveats

* This repo contains **spoilers**, i.e. solutions to some of the puzzles. Use at
  your discretion.
* I'm brand new to Elixir, so this is largely practice for me. My solutions are
  likely not the best examples of "good" Elixir. If you see anything
  particularly egregious or have a cool way to improve a solution, feel
  free to submit an issue/PR.
* I do the challenges for fun, at my leisure. Plenty of the solutions are
  ugly/inefficient/incomplete. While I'm more than happy to take suggestions for
  existing solutions, please don't submit PRs for days I _haven't_ completed
  yet (I don't want spoilers 😉). See
  https://twitter.com/ericwastl/status/1467243576966983685
* I don't intend to keep a clean commit history, so watch out if you get
  conflicts.

## Usage

Solutions and tests are structured by year and day.
For example, the solution for 2020's day 1 is `lib/advent/y2020/d01.ex` and
its respective test is `test/advent/y2020/d01_test.exs`. If a puzzle had an
input file you'll find it under a test `support` directory, e.g.
`test/y2020/support/d01_input.txt`.

### Generate code scaffold for a given day

You can generate a scaffold for a given day by running:

```
mix advent.template <YYYY> <dd>
```

For example, `mix advent.template 2021 7` will generate

* `lib/advent/y2021/d07.ex`. Has two empty functions `part_one/1` and
  `part_two/1`
* `test/advent/y2021/d07_test.exs`. Has 4 unit tests, 2 for each part. Each
  part has one for example input and another for file input
* `test/advent/y2021/support/d07_input.txt`. An empty file to copy/paste your
  puzzle input into

### Running tests

You can run all tests with `mix test`. However, some of my solutions take an
order of seconds. So I'd recommend testing something more narrow like a year
or day. Some other examples would be `mix test test/advent/y2021/` for a whole
year or `mix test test/advent/y2021/d07_test.exs` for a full day.

You can read more about `mix test` options
[here](https://hexdocs.pm/mix/1.12/Mix.Tasks.Test.html).

## Completion matrix

* ⭐ just part one
* 🌟 both parts

| Day | 2015 | 2016 | 2017 | 2018 | 2019 | 2020 | 2021 |
| :-: | :--: | :--: | :--: | :--: | :--: | :--: | :--: |
| 1   | 🌟   | 🌟   | 🌟   | 🌟   | 🌟   | 🌟   | 🌟   |
| 2   | 🌟   |      |      |      |      | 🌟   | 🌟   |
| 3   | 🌟   |      |      |      |      | 🌟   | 🌟   |
| 4   | 🌟   |      |      |      |      | 🌟   | 🌟   |
| 5   | 🌟   |      |      |      |      | 🌟   | 🌟   |
| 6   |      |      |      |      |      | 🌟   | 🌟   |
| 7   |      |      |      |      |      | 🌟   | 🌟   |
| 8   |      |      |      |      |      | 🌟   | 🌟   |
| 9   |      |      |      |      |      | 🌟   | 🌟   |
| 10  |      |      |      |      |      | ⭐   | 🌟   |
| 11  |      |      |      |      |      | ⭐   | 🌟   |
| 12  |      |      |      |      |      | 🌟   | 🌟   |
| 13  |      |      |      |      |      | ⭐   | 🌟   |
| 14  |      |      |      |      |      | ⭐   |      |
| 15  |      |      |      |      |      | 🌟   |      |
| 16  |      |      |      |      |      | ⭐   |      |
| 17  |      |      |      |      |      |      |      |
| 18  |      |      |      |      |      |      |      |
| 19  |      |      |      |      |      |      |      |
| 20  |      |      |      |      |      |      |      |
| 21  |      |      |      |      |      |      |      |
| 22  |      |      |      |      |      |      |      |
| 23  |      |      |      |      |      |      |      |
| 24  |      |      |      |      |      |      |      |
| 25  |      |      |      |      |      |      |      |

## License

This project is licensed under the
[MIT License](https://choosealicense.com/licenses/mit/). See the
[LICENSE](https://github.com/ed-flanagan/advent-of-code-solutions-elixir/blob/main/LICENSE)
file for more details.
