# 🎄 [Advent of Code](https://adventofcode.com/) solutions in [Elixir](https://elixir-lang.org/) ⚗️

[![Coverage Status](https://coveralls.io/repos/github/ed-flanagan/advent-of-code-solutions-elixir/badge.svg?branch=main)](https://coveralls.io/github/ed-flanagan/advent-of-code-solutions-elixir?branch=main)

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

Solutions, tests, and input are structured by years and day.
* Solutions: `lib/advent/y<YYYY>/d<DD>.ex`, e.g. `lib/advent/y2020/d01.ex`
* Tests: `test/advent/y<YYYY>/d<DD>_test.exs`, e.g. `test/advent/y2020/d01_test.exs`
* Input: `priv/puzzle_input/y<YYYY>/d<DD>.txt`, e.g. `priv/puzzle_input/y2020/d01.txt`

### Generate code scaffold for a given day

You can generate a scaffold for a given day by running:

```
mix aoc.gen.day <YYYY> <dd> [--session <TOKEN>]
```

For example, `mix aoc.gen.day 2021 7` will generate

* `lib/advent/y2021/d07.ex`. Has two empty functions `part_one/1` and
  `part_two/1`
* `test/advent/y2021/d07_test.exs`. Has 4 unit tests, 2 for each part. Each
  part has one for example input and another for file input
* `priv/puzzle_input/y2021/d07.txt`. An empty file to copy/paste your puzzle
  input into

The optional `--session` flag takes your web browser session token (you can
retrieve if you inspect the web page while logged in). If provided, the task
will attempt to download your input file.

### Running tests

You can run all tests with `mix test`.

However, some of my solutions take an order of seconds. So I recommend testing
a narrowed scope, e.g. a specific day or year.
For example: `mix test test/advent/y2021/` tests a specific year and
`mix test test/advent/y2021/d07_test.exs` tests a specific day.

Further, some tests are tagged as `long_running: true`. These tests typically
take longer than 10 seconds to complete on my laptop. Tests with this
tag are excluded by default. To include these tests add
`--include long_running:true` to your `mix test` command.

You can read more about `mix test` options
[here](https://hexdocs.pm/mix/Mix.Tasks.Test.html).

## Completion matrix

* ⭐ just part one
* 🌟 both parts

| Day | 2015 | 2016 | 2017 | 2018 | 2019 | 2020 | 2021 | 2022 | 2023 |
| :-: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: |
| 1   | 🌟   | 🌟   | 🌟   | 🌟   | 🌟   | 🌟   | 🌟   | 🌟   | 🌟   |
| 2   | 🌟   |      |      |      |      | 🌟   | 🌟   | 🌟   | 🌟   |
| 3   | 🌟   |      |      |      |      | 🌟   | 🌟   | 🌟   | 🌟   |
| 4   | 🌟   |      |      |      |      | 🌟   | 🌟   | 🌟   | 🌟   |
| 5   | 🌟   |      |      |      |      | 🌟   | 🌟   | 🌟   |      |
| 6   |      |      |      |      |      | 🌟   | 🌟   | 🌟   |      |
| 7   |      |      |      |      |      | 🌟   | 🌟   | 🌟   |      |
| 8   |      |      |      |      |      | 🌟   | 🌟   | 🌟   |      |
| 9   |      |      |      |      |      | 🌟   | 🌟   | 🌟   |      |
| 10  |      |      |      |      |      | ⭐   | 🌟   | 🌟   |      |
| 11  |      |      |      |      |      | ⭐   | 🌟   | 🌟   |      |
| 12  |      |      |      |      |      | 🌟   | 🌟   | 🌟   |      |
| 13  |      |      |      |      |      | ⭐   | 🌟   | 🌟   |      |
| 14  |      |      |      |      |      | ⭐   | 🌟   |      |      |
| 15  |      |      |      |      |      | 🌟   | 🌟   |      |      |
| 16  |      |      |      |      |      | ⭐   | 🌟   |      |      |
| 17  |      |      |      |      |      |      |      |      |      |
| 18  |      |      |      |      |      |      |      |      |      |
| 19  |      |      |      |      |      |      |      |      |      |
| 20  |      |      |      |      |      |      | 🌟   |      |      |
| 21  |      |      |      |      |      |      | ⭐   |      |      |
| 22  |      |      |      |      |      |      |      |      |      |
| 23  |      |      |      |      |      |      |      |      |      |
| 24  |      |      |      |      |      |      |      |      |      |
| 25  |      |      |      |      |      |      | ⭐   |      |      |

## License

This project is licensed under the
[MIT License](https://choosealicense.com/licenses/mit/). See the
[LICENSE](https://github.com/ed-flanagan/advent-of-code-solutions-elixir/blob/main/LICENSE)
file for more details.
