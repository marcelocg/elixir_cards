defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck creates a 52 cards deck" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 52
  end
end
