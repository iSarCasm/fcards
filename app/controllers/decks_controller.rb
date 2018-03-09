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
    repeat_session = RepeatSession.new(deck: find_deck)
    session[:repeat_session] = repeat_session.to_h
    random_card = repeat_session.random_card
    redirect_to deck_card_path(find_deck, random_card)
  end

  def repeat_session_finished
  end

  private 

  def deck_params
    params.require(:deck).permit(:deck_title)
  end

  def find_deck
    Deck.find(params[:id])
  end
end
