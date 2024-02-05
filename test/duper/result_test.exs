defmodule Duper.ResultsTest do
  use ExUnit.Case

  test "can add entries to the results" do
    Duper.add_hash_for("path1", 123)
    Duper.add_hash_for("path2", 456)
    Duper.add_hash_for("path3", 123)
    Duper.add_hash_for("path4", 789)
    Duper.add_hash_for("path5", 456)
    Duper.add_hash_for("path6", 999)
    duplicates = Duper.find_duplicates()
    assert length(duplicates) == 2
    assert ~w{path3 path1} in duplicates
    assert ~w{path5 path2} in duplicates
  end
end
