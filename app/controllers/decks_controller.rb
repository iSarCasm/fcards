class DecksController < ApplicationController
  def index
    @decks = Deck.high_order
    @stats = Stats.per_day
  end

  def show
    @deck = find_deck
  end

  def new
    @deck = Deck.new
  end

  def create
    Deck.create! deck_params
    redirect_to decks_path
  end

  def repeat
    random_card = find_deck.cards.to_a.shuffle.first
    redirect_to deck_card_path(find_deck, random_card)
  end

  private 

  def deck_params
    params.require(:deck).permit(:deck_title)
  end

  def find_deck
    Deck.find(params[:id])
  end
end
