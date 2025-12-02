defmodule Advent.Helpers do
  @moduledoc """
  Generic helper functions useful for multiple puzzles
  """

  def fixed_range(a, b) when a > b, do: a..b//-1
  def fixed_range(a, b), do: a..b
end
