class CardsController < ApplicationController
  def show
    @card = find_card
  end

  def new
    @card = deck.cards.new
  end

  def edit
    @card = find_card
  end

  def create
    card = deck.cards.new card_params
    card.order_number = deck.cards.order(:order_number).last&.order_number.to_i + 1
    card.save!
    redirect_to deck_path(deck)
  end

  def update
    card = find_card
    card.update(card_params)
    redirect_to deck_card_url(card.deck, card)
  end

  def answer
    @answer = find_card.answer
  end

  def right
    repeat_session = RepeatSession.from(data_hash: session[:repeat_session])
    repeat_session.add_correct_answer(find_card)
    session[:repeat_session] = repeat_session.to_h
    random_card = repeat_session.random_card

    find_card.update(priority: find_card.priority + 1)

    if random_card
      redirect_to deck_card_path(deck, random_card)
    else
      redirect_to repeat_session_finished_deck_path(deck)
    end
  end

  def wrong
    repeat_session = RepeatSession.from(data_hash: session[:repeat_session])
    repeat_session.add_wrong_answer(find_card)
    session[:repeat_session] = repeat_session.to_h
    random_card = repeat_session.random_card
    if random_card
      redirect_to deck_card_path(deck, random_card)
    else
      redirect_to repeat_session_finished_deck_path(deck)
    end
  end

  private

  def card_params
    params.require(:card).permit(:question, :answer)
  end

  def deck
    Deck.find(params[:deck_id])
  end

  def find_card
    deck.cards.find(params[:id])
  end
end
