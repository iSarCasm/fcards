class DecksController < ApplicationController
  def index
    @decks = Deck.all
  end

  def show
    @deck = find_deck
  end

  def repeat
    random_card = find_deck.cards.to_a.shuffle.first
    redirect_to deck_card_url(random_card)
  end

  private 

  def find_deck
    Deck.find(params[:id])
  end
end
