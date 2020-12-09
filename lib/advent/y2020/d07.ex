defmodule Advent.Y2020.D07 do
  @rule_split_on [" bags contain ", " bag, ", " bags, ", " bag.", " bags."]

  ##########
  # Part 1 #
  ##########

  def part_one(rules) do
    rules
    |> build_converse_graph()
    |> count_reachable_colors()
  end

  defp build_converse_graph(rules) do
    Enum.reduce(rules, %{}, fn rule, graph ->
      [bag | contents] = String.split(rule, @rule_split_on, trim: true)
      add_edges(contents, bag, graph)
    end)
  end

  defp add_edges(["no other"], _bag, graph), do: graph

  defp add_edges(contents, bag, graph) do
    Enum.reduce(contents, graph, fn c, graph ->
      [_num, color] = String.split(c, " ", parts: 2)
      Map.update(graph, color, MapSet.new([bag]), &MapSet.put(&1, bag))
    end)
  end

  defp count_reachable_colors(graph) do
    do_find_reachable_colors(graph, "shiny gold", MapSet.new())
    |> MapSet.size()
    |> (&(&1 - 1)).()
  end

  defp do_find_reachable_colors(graph, color, seen) do
    seen = MapSet.put(seen, color)
    next = Map.get(graph, color, MapSet.new())

    for c <- next, c not in seen, reduce: seen do
      seen -> do_find_reachable_colors(graph, c, seen)
    end
  end

  ##########
  # Part 2 #
  ##########

  def part_two(rules) do
    rules
    |> build_graph()
    |> count_bags()
  end

  defp build_graph(rules) do
    Enum.reduce(rules, %{}, fn rule, graph ->
      [bag | contents] = String.split(rule, @rule_split_on, trim: true)
      Map.put(graph, bag, to_colors(contents))
    end)
  end

  defp to_colors(["no other"]), do: nil

  defp to_colors(contents) do
    Enum.reduce(contents, %{}, fn items, holds ->
      [num, color] = String.split(items, " ", parts: 2)
      Map.put(holds, color, String.to_integer(num))
    end)
  end

  defp count_bags(graph) do
    do_count_bags(graph, Map.get(graph, "shiny gold", nil))
  end

  defp do_count_bags(_graph, nil), do: 0

  defp do_count_bags(graph, bags) do
    Enum.reduce(bags, 0, fn {color, num}, sum ->
      sum + num + num * do_count_bags(graph, Map.get(graph, color, nil))
    end)
  end
end
