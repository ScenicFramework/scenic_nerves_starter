defmodule ScenicNervesStarterTest do
  use ExUnit.Case
  doctest ScenicNervesStarter

  test "greets the world" do
    assert ScenicNervesStarter.hello() == :world
  end
end
