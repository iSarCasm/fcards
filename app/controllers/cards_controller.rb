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
    if params[:is_reverse]
      reverse_card = deck.cards.new card_params
      reverse_card.answer, reverse_card.question = reverse_card.question, reverse_card.answer
      reverse_card.order_number = deck.cards.order(:order_number).last&.order_number.to_i + 1
      reverse_card.save!
    end
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
