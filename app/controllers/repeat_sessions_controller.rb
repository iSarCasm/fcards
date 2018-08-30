class RepeatSessionsController < ApplicationController
  def new
    @decks = decks
  end

  def create
    repeat_session = RepeatSession.create(params[:type], { decks: decks, questions: questions })
    session[:repeat_session] = repeat_session.to_h
    next_card = repeat_session.next_card
    redirect_to repeat_session_card_path(next_card)
  end

  def finished
    session[:repeat_session] = nil
  end

  private

  def current_session
    RepeatSession.from(data_hash: session[:repeat_session])
  end

  def decks
    Deck.find(params[:decks])
  end

  def questions
    params[:questions].to_i
  end
end
