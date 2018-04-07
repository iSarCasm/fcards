class RepeatSessionsController < ApplicationController
  def new
    @deck = deck   
  end

  def create
    binding.pry
    repeat_session = RepeatSession.create(session_params[:type], {deck: deck, questions: questions})
    session[:repeat_session] = repeat_session.to_h
    next_card = repeat_session.next_card
    redirect_to repeat_session_card_path(next_card)
  end

  private

  def current_session
    RepeatSession.from(data_hash: session[:repeat_session])
  end

  def session_params
    params.permit(:type, :questions, :deck)
  end

  def deck
    Deck.find(session_params[:deck])
  end

  def questions
    session_params[:questions].to_i
  end
end
