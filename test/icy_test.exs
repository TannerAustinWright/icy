defmodule IcyTest do
  use ExUnit.Case
  doctest Icy

  test "greets the world" do
    assert Icy.hello() == :world
  end
end
