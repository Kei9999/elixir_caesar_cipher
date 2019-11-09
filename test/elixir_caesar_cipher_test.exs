defmodule ElixirCaesarCipherTest do
  use ExUnit.Case
  doctest ElixirCaesarCipher

  test "greets the world" do
    assert ElixirCaesarCipher.hello() == :world
  end
end
