defmodule PruTest do
  use ExUnit.Case
  doctest Pru

  test "greets the world" do
    assert Pru.hello() == :world
  end
end
