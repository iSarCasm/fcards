class DecksController < ApplicationController
  def index
    @decks = Deck.high_order
    @stats = Stats.per_day
  end

  def show
    @deck = deck
  end

  def new
    @deck = Deck.new
  end

  def create
    Deck.create! deck_params
    redirect_to decks_path
  end

  def repeat_distributed
    repeat_session = RepeatSession::Distributed.new(decks: [deck])
    session[:repeat_session] = repeat_session.to_h
    next_card = repeat_session.next_card
    redirect_to deck_card_path(deck, next_card)
  end

  def repeat_random
    repeat_session = RepeatSession::Random.new(decks: [deck])
    session[:repeat_session] = repeat_session.to_h
    next_card = repeat_session.next_card
    redirect_to deck_card_path(deck, next_card)
  end

  def repeat_orderly
    repeat_session = RepeatSession::Orderly.new(decks: [deck])
    session[:repeat_session] = repeat_session.to_h
    next_card = repeat_session.next_card
    redirect_to deck_card_path(deck, next_card)
  end

  def repeat_session_finished
  end

  private

  def deck_params
    params.require(:deck).permit(:deck_title)
  end

  def deck
    Deck.find(params[:id])
  end
end
