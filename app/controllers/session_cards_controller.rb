class SessionCardsController < ApplicationController
  def show
    @card = find_card

    unless current_session
      redirect_to deck_card_path(@card.deck, @card)
    end
  end

  def answer
    @answer = find_card.answer
  end

  def right
    current_session.add_correct_answer(find_card)
    session[:repeat_session] = current_session.to_h
    next_card = current_session.next_card

    find_card.update(priority: find_card.priority + 1)

    if next_card
      redirect_to repeat_session_card_path(next_card)
    else
      redirect_to finished_repeat_session_path
    end
  end

  def wrong
    current_session.add_wrong_answer(find_card)
    session[:repeat_session] = current_session.to_h
    next_card = current_session.next_card

    find_card.update(priority: find_card.priority / 2)

    if next_card
      redirect_to repeat_session_card_path(next_card)
    else
      redirect_to finished_repeat_session_path
    end
  end

  def destroy
    session[:repeat_session] = nil
  end

  private

  def current_session
    RepeatSession.from(data_hash: session[:repeat_session])
  end

  def find_card
    Card.find(params[:id])
  end
end
