defmodule Mix.Tasks.Advent.TemplateTest do
  use ExUnit.Case, async: true

  @year "1970"
  @day "1"

  @project_root Path.join([__DIR__, "..", "..", "..", ".."])
  @support_dir Path.join([__DIR__, "support"])

  @example_lib_dir Path.join([@project_root, "lib", "advent", "y#{@year}"])
  @example_test_dir Path.join([@project_root, "test", "advent", "y#{@year}"])

  setup do
    on_exit(fn ->
      File.rm_rf!(@example_lib_dir)
      File.rm_rf!(@example_test_dir)
    end)
  end

  describe "run/1" do
    test "expected output" do
      :ok = Mix.Tasks.Advent.Template.run([@year, @day])

      {:ok, expected_lib_contents} =
        Path.join([@support_dir, "template_expected_lib_output.ex"]) |> File.read()

      {:ok, expected_test_contents} =
        Path.join([@support_dir, "template_expected_test_output.exs"]) |> File.read()

      expected_input_contents = ""

      {:ok, actual_lib_contents} = Path.join([@example_lib_dir, "d01.ex"]) |> File.read()
      {:ok, actual_test_contents} = Path.join([@example_test_dir, "d01_test.exs"]) |> File.read()

      {:ok, actual_input_contents} =
        Path.join([@example_test_dir, "support", "d01_input.txt"]) |> File.read()

      assert actual_lib_contents == expected_lib_contents
      assert actual_test_contents == expected_test_contents
      assert actual_input_contents == expected_input_contents
    end
  end
end
