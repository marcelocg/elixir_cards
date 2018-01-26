defmodule Cards do
  @moduledoc """
  Cards is a learning project from the Complete Elixir and Phoenix Bootcamp on Udemy
  """

  @doc """
  Creates a deck of cards for a card playing game
  """
  def create_deck do
    values = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
    suits  = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # List comprehensions
    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end
  end

  @doc """
  Shuffles the cards in a deck
  """
  def shuffle(deck) do
    Enum.shuffle deck
  end

  @doc """
  Checks if a card is present in a deck
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Deals a hand of cards from a complete deck.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    # Explanations on tuples and pattern matching
    Enum.split(deck, hand_size)
  end

  @doc """
  Persists a deck to the filesystem in binary format for later retrieval and use
  """
  def save(deck, filename) do
    # (Lecture 18) Explanations on using Erlang from inside Elixir code
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Loads a deck from the filesystem
  """
  def load(filename) do
    # (Lecture 19) Pattern matching continued
    # (Lecture 20) Pattern matching in Case statements
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exist or does not contain a readable deck."
    end
  end

  @doc """
  Forms a hand of a given number (`hand_size` param) of shuffled cards from the complete deck
  """
  def create_hand(hand_size) do
    create_deck()
    |> shuffle
    |> deal(hand_size)
  end
end
