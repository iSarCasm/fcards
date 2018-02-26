class CardsController < ApplicationController
  def show
    @card = find_card
  end

  def new
    @card = deck.cards.new
  end

  def create
    card = deck.cards.new card_params
    card.order_number = deck.cards.order(:order_number).last&.order_number.to_i + 1
    card.save!
    redirect_to deck_path(deck)
  end

  def answer
    @card = find_card
  end

  def right
    @card = find_card
    render 'cards/responded', locals: { card: @card }
  end

  def wrong
    @card = find_card
    render 'cards/responded', locals: { card: @card }
  end

  def next
    random_card_id = 1 + rand(find_card.deck.cards.count)
    random_card = find_card.deck.cards.find(random_card_id)
    redirect_to deck_card_url(random_card.deck, random_card)
  end

  private

  def card_params
    params.require(:card).permit(:question, :answer)
  end

  def deck
    Deck.find(params[:deck_id])
  end

  def find_card
    Card.find(params[:id])
  end
end
